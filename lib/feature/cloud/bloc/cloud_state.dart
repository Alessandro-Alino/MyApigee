part of 'cloud_cubit.dart';

@freezed
sealed class CloudState with _$CloudState {
  const factory CloudState({
    @Default(CloudStatus.initial) CloudStatus status,
    @Default([]) final List<CloudItem> files,
    @Default([]) final List<String> breadcrumb,
    @Default(false) final bool isNetworking,
    @Default(0.0) final double networkingProgress,
    final String? networkingFileId,
    @Default([]) final List<FileUploadModel> fileUploads,
    final InfoMex? infoMex,
  }) = _CloudState;

  static CloudState initState() => const CloudState(
    status: CloudStatus.initial,
    files: [],
    breadcrumb: [],
    isNetworking: false,
    networkingProgress: 0.0,
    networkingFileId: null,
    fileUploads: [],
    infoMex: null,
  );
}

enum CloudStatus { initial, loading, success, error }
