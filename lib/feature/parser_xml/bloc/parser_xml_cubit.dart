import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapigee/feature/parser_xml/model/api_model.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';
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
      emit(
        state.copyWith(
          status: ParserXmlStatus.selected,
          file: file,
          fileName: fileName,
        ),
      );
    } else {
      log('Nessun file selezionato');
    }
  }

  // Parse XML
  void parseXml(String selectedXml) {
    try {
      // Get XML doc.
      final XmlDocument xmlDocument = XmlDocument.parse(selectedXml);
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

  // Extract API
  List<ApiModel> _extractApi(XmlDocument xmlDocument) {
    final List<ApiModel> apiModels = [];

    xmlDocument.findAllElements('Flow').forEach((flow) {
      // 1) name API
      final nameApiReg = RegExp('<Flow\\s+name="([^"]+)"');
      final nameApi = nameApiReg.firstMatch(flow.outerXml)?.group(1);

      // 2) api
      final apiReg = RegExp('MatchesPath\\s+"([^"]+)"');
      final api = apiReg.firstMatch(flow.outerXml)?.group(1);

      // 3) method
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
