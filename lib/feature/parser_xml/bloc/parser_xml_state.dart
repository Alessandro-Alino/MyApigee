part of 'parser_xml_cubit.dart';

@freezed
sealed class ParserXmlState with _$ParserXmlState {
  const factory ParserXmlState({
    required ParserXmlStatus status,
    final File? file,
    final Uint8List? fileBytes,
    final String? fileName,
    final XmlDocument? xmlDocument,
    final String? basepath,
    @Default([]) final List<ApiModel> apiModels,
    @Default([]) final List<ApiModel> apiModelsFiltered,
    @Default(false) final bool isSelectMode,
    final List<ApiModel>? apiToExport,
    final String? xml,
    final InfoMex? infoMex,
  }) = _ParserXmlState;

  static ParserXmlState initState() => const ParserXmlState(
    status: ParserXmlStatus.initial,
    file: null,
    fileBytes: null,
    fileName: null,
    xmlDocument: null,
    basepath: null,
    apiModels: [],
    isSelectMode: false,
    apiToExport: null,
    apiModelsFiltered: [],
    xml: null,
    infoMex: null,
  );
}

enum ParserXmlStatus { initial, selected, loading, success }
