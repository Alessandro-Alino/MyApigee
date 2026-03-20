import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'file_upload_model.freezed.dart';

enum FileUploadStatus { init, loading, success, error }

@freezed
sealed class FileUploadModel with _$FileUploadModel {
  const factory FileUploadModel({
    @Default(FileUploadStatus.init) FileUploadStatus fileUploadStatus,
    required File fileUpload,
    @Default('') String fileName,
  }) = _FileUploadModel;

}
