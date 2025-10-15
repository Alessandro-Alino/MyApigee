part of 'parser_xml_cubit.dart';

@freezed
sealed class ParserXmlState with _$ParserXmlState {
  const factory ParserXmlState({
    required ParserXmlStatus status,
    File? file,
    String? fileName,
    XmlDocument? xmlDocument,
    List<ApiModel>? apiModels,
    List<ApiModel>? apiModelsFiltered,
    String? xml,
    String? errorMex,
  }) = _ParserXmlState;

  static ParserXmlState initState() => const ParserXmlState(
    status: ParserXmlStatus.initial,
    file: null,
    fileName: null,
    xmlDocument: null,
    apiModels: null,
    apiModelsFiltered: null,
    xml: null,
    errorMex: null,
  );
}

enum ParserXmlStatus { initial, selected, loading, success }
