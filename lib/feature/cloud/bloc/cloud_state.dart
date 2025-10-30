part of 'cloud_cubit.dart';

@freezed
sealed class CloudState with _$CloudState {
  const factory CloudState({
    @Default(CloudStatus.initial) CloudStatus status,
    @Default([]) final List<FileObject> files,
    @Default(false) final bool isNetworking,
    @Default(0.0) final double networkinProgress,
    final String? networkingFileId,
    final File? selectedFileUpload,
    final String? selectedFileUploadName,
    final InfoMex? infoMex,
  }) = _CloudState;

  static CloudState initState() => const CloudState(
    status: CloudStatus.initial,
    files: [],
    isNetworking: false,
    networkinProgress: 0.0,
    selectedFileUpload: null,
    selectedFileUploadName: null,
    infoMex: null,
  );
}

enum CloudStatus { initial, loading, success, error }
