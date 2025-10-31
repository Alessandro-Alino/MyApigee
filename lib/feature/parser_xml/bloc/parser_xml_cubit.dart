import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';
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
        log('No FileBytes');
        log('FILE: ${result.files.single}');
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

  // Parse XML
  void parseXml() {
    String? file;

    if (kIsWeb) {
      log('WEB');
      if (kIsWasm) {
        log('WEB - WASM');
      }
      if (state.fileBytes != null) {
        file = utf8.decode(state.fileBytes!);
      }
    } else {
      log('NOT - WEB');
      if (state.file != null) {
        file = state.file!.readAsStringSync();
      }
    }

    if (file == null || file.isEmpty) {
      _showMex(mex: 'Nessun file selezionato', type: MexType.error);
    } else {
      //final String file = state.file!.readAsStringSync();
      try {
        // Get XML doc.
        final XmlDocument xmlDocument = XmlDocument.parse(file);
        final String xml = xmlDocument.toXmlString(pretty: true);
        // Extract API
        List<ApiModel> apiModels = _extractApi(xmlDocument);
        emit(
          state.copyWith(
            status: ParserXmlStatus.success,
            xmlDocument: xmlDocument,
            xml: xml,
            apiModels: apiModels,
            apiModelsFiltered: apiModels,
          ),
        );
      } catch (e) {
        _showMex(mex: 'Errore di parsing XML: $e', type: MexType.error);
      }
    }
  }

  // Extract API
  List<ApiModel> _extractApi(XmlDocument xmlDocument) {
    final List<ApiModel> apiModels = [];

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
        // log('Found the "notFound API"');
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
    if (state.apiModels == null) {
      return;
    } else if (reset == true || method == null) {
      emit(state.copyWith(apiModelsFiltered: state.apiModels));
    } else {
      // Else filter API by Method
      List<ApiModel> apiModelsFiltered = state.apiModels!
          .where((e) => e.method == method)
          .toList();
      emit(state.copyWith(apiModelsFiltered: apiModelsFiltered));
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
