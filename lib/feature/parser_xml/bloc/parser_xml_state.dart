part of 'parser_xml_cubit.dart';

@freezed
sealed class ParserXmlState with _$ParserXmlState {
  const factory ParserXmlState({
    required ParserXmlStatus status,
    final File? file,
    final Uint8List? fileBytes,
    final String? fileName,
    final XmlDocument? xmlDocument,
    final List<ApiModel>? apiModels,
    final List<ApiModel>? apiModelsFiltered,
    final String? xml,
    final InfoMex? infoMex,
  }) = _ParserXmlState;

  static ParserXmlState initState() => const ParserXmlState(
    status: ParserXmlStatus.initial,
    file: null,
    fileBytes: null,
    fileName: null,
    xmlDocument: null,
    apiModels: null,
    apiModelsFiltered: null,
    xml: null,
    infoMex: null,
  );
}

enum ParserXmlStatus { initial, selected, loading, success }
