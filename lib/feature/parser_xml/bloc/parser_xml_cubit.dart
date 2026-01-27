import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapigee/feature/parser_xml/export/export.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:xml/xml.dart';

part 'parser_xml_state.dart';

part 'parser_xml_cubit.freezed.dart';

class ParserXmlCubit extends Cubit<ParserXmlState> {
  ParserXmlCubit() : super(ParserXmlState.initState());

  // File Picker
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xml'],
    );

    if (result != null) {
      final File file = File(result.files.single.path!);
      final String fileName = result.files.single.name;
      final Uint8List? fileBytes = result.files.single.bytes;

      if (fileBytes == null) {
        // log('No FileBytes');
        // log('FILE: ${result.files.single}');
      }
      emit(
        state.copyWith(
          status: ParserXmlStatus.selected,
          file: file,
          fileBytes: fileBytes,
          fileName: fileName,
        ),
      );
    } else {
      log('Nessun file selezionato');
    }
  }

  String _getXmlContent({String? providedXml}) {
    // If user paste XML, return it
    if (providedXml != null) return providedXml;

    // If user select a file in WASM Web version, return utf8 decode
    if (kIsWeb) {
      if (kIsWasm) {
        log('IS_WASM');
      }
      final bytes = state.fileBytes;
      if (bytes != null) return utf8.decode(bytes);
      return '';
    }

    final file = state.file;
    return file?.readAsStringSync() ?? '';
  }

  // Parse XML
  void parseXml({String? providedXml}) {
    final xmlContent = _getXmlContent(providedXml: providedXml);

    if (xmlContent.isEmpty) {
      _showMex(mex: 'Nessun file selezionato', type: MexType.error);
      return;
    }

    try {
      final xmlDocument = XmlDocument.parse(xmlContent);
      // Extract API
      List<ApiModel> apiModels = _extractApi(xmlDocument);
      emit(
        state.copyWith(
          status: ParserXmlStatus.success,
          xmlDocument: xmlDocument,
          xml: xmlDocument.toXmlString(pretty: true),
          apiModels: apiModels,
          apiModelsFiltered: apiModels,
        ),
      );
    } catch (e) {
      _showMex(mex: 'Errore di parsing XML: $e', type: MexType.error);
    }
  }

  // Extract API
  List<ApiModel> _extractApi(XmlDocument xmlDocument) {
    final List<ApiModel> apiModels = [];

    // Find Basepath
    final basePathElement = xmlDocument.findAllElements('BasePath').firstOrNull;
    if (basePathElement != null) {
      // 3. Estrai il testo
      final basepath = basePathElement.innerText;
      emit(state.copyWith(basepath: basepath));
    } else {
      _showMex(mex: 'Nessun basepath trovato', type: MexType.error);
    }

    // Find Basepath
    xmlDocument.nodes.map((e) {
      log(e.toString());
    });

    // Find all <Flow> elements
    xmlDocument.findAllElements('Flow').forEach((flow) {
      // Name API
      final nameApiReg = RegExp('<Flow\\s+name="([^"]+)"');
      final nameApi = nameApiReg.firstMatch(flow.outerXml)?.group(1);

      // Api
      final apiReg = RegExp('MatchesPath\\s+"([^"]+)"');
      final api = apiReg.firstMatch(flow.outerXml)?.group(1);

      // Method
      final methodReg = RegExp('request\\.verb\\s*=\\s*"([^"]+)"');
      final methodz = methodReg.firstMatch(flow.outerXml)?.group(1);

      if (nameApi == 'notFound') {
        // Found the "notFound API"
        return;
      } else {
        // If method is not null, add it to the list
        if (methodz != null) {
          Method method = Method.values.singleWhere(
            (e) => e.name.toLowerCase() == methodz.toLowerCase(),
          );
          final ApiModel apiModel = ApiModel(
            api: api!,
            apiName: nameApi!,
            method: method,
          );
          apiModels.add(apiModel);
        } else {
          _showMex(mex: 'Method non trovato', type: MexType.error);
        }
      }
    });
    return apiModels;
  }

  // Filter API by Method
  void filterByMethod(Method? method, {bool? reset = false}) {
    // If no API, return
    if (state.apiModels.isEmpty) {
      return;
    }
    // If no method, return all API
    else if (reset == true || method == null) {
      emit(state.copyWith(apiModelsFiltered: state.apiModels));
    }
    // Else filter API by Method
    else {
      // Filter API list by Method
      List<ApiModel> apiModelsFiltered = state.apiModels
          .where((e) => e.method == method)
          .toList();
      // If click on the method that is arleady selected, return all API
      if (state.apiModelsFiltered.length != state.apiModels.length &&
          method == state.apiModelsFiltered.first.method) {
        emit(state.copyWith(apiModelsFiltered: state.apiModels));
      }
      // Return filtered API
      else {
        emit(state.copyWith(apiModelsFiltered: apiModelsFiltered));
      }
    }
  }

  // Toggle Select Mode
  void toggleSelectMode(bool selectedMode) {
    emit(state.copyWith(isSelectMode: selectedMode, apiToExport: []));
  }

  // Select Api to Export
  void selectAPItoExport(ApiModel apiModel) {
    List<ApiModel> apiToExport = List.from(state.apiToExport ?? []);

    if (apiToExport.contains(apiModel)) {
      apiToExport.remove(apiModel);
    } else {
      apiToExport.add(apiModel);
    }
    emit(state.copyWith(apiToExport: apiToExport));
  }

  // Export in Postman Collection
  void exportPostman(List<ApiModel> apiList) async {
    final postmanCollection = Export.postmanCollectionV2(
      state.basepath!,
      apiList,
    );

    final content = jsonEncode(postmanCollection);
    final String fileNameWithExt =
        "api-001-${state.basepath!.replaceAll("/", "")}.json";
    if (!kIsWeb) {
      saveFile(fileNameWithExt, content);
    } else {
      // Download Postman Collection from Web
    }
  }

  // Export in Excel
  void exportExcel(List<ApiModel> apiList) async {
    final excel = Export().exportExcel(state.basepath!, apiList);
    final String fileNameWithExt =
        "api-001-${state.basepath!.replaceAll("/", "")}.xlsx";
    try {
      final fileBytes = excel.save()!;
      var directory = await getDownloadsDirectory();

      // 5. Scrivi il file
      await File(p.join(directory!.path, fileNameWithExt)).writeAsBytes(fileBytes);
      _showMex(mex: 'File salvato!', type: MexType.success);
    } catch (e) {
      log('Bloc Error: $e');
      _showMex(mex: 'Qualcosa è andato storto!', type: MexType.error);
    }
  }

  // Save file on Directory
  void saveFile(String fileNameWithExt, String content) async {
    if (!kIsWeb) {
      try {
        // Get Download Directory
        final directory = await getDownloadsDirectory();
        // File name
        String fileName = fileNameWithExt;
        // Create File
        final file = File('${directory?.path}\\$fileName');
        // Download File
        await file.writeAsString(content);
        _showMex(mex: 'File salvato!', type: MexType.success);
      } catch (e) {
        log('Bloc Error: $e');
        _showMex(mex: 'Qualcosa è andato storto!', type: MexType.error);
      }
    } else {
      _showMex(mex: 'In Arrivo...', type: MexType.info);
    }
  }

  // Show Mex
  void _showMex({required String mex, required MexType type}) {
    emit(
      state.copyWith(
        infoMex: InfoMex(mex: mex, type: type),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(infoMex: null));
    });
  }

  // Init
  void init() {
    emit(ParserXmlState.initState());
  }
}
