import 'dart:developer';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class CloudRepo {
  // Singleton
  static final CloudRepo _instance = CloudRepo._internal();

  factory CloudRepo() => _instance;

  CloudRepo._internal();

  final SupabaseClient _supabase = SupabaseClient(
    const String.fromEnvironment('supabaseUrl'),
    const String.fromEnvironment('sbPublishable'),
  );

  final String _bucketName = const String.fromEnvironment('bucketName');

  // Get the list of files in the bucket
  Future<List<FileObject>> listFiles({String? path}) async {
    List<FileObject> response = [];
    response = await _supabase.storage.from(_bucketName).list(path: path);
    return response;
  }

  // Download file from get the URL of a file in the bucket
  Future<String> getFileUrl(String path, String fileName) async {
    final pathCreateUrl = path.isEmpty ? fileName : '$path/$fileName';
    final url = await _supabase.storage
        .from(_bucketName)
        .createSignedUrl(pathCreateUrl, 60);
    return url;
  }

  // Download a file from the bucket
  Future<Uint8List> downloadFile(String path, String fileName) async {
    final result = await _supabase.storage
        .from(_bucketName)
        .download('$path/$fileName');
    return result;
  }

  // Upload a file to the bucket
  Future<String> uploadFile(
    String path,
    String fileName,
    Uint8List bytes,
  ) async {
    final pathToUpload = path.isEmpty ? fileName : '$path/$fileName';
    await _supabase.storage
        .from(_bucketName)
        .uploadBinary(
          pathToUpload,
          bytes,
          fileOptions: const FileOptions(upsert: true),
        );
    return fileName;
  }

  // Delete a file from the bucket
  Future<List<FileObject>> deleteFile(String path, String fileName) async {
    final pathToRemove = path.isEmpty ? fileName : '$path/$fileName';
    log('CLOUD_REPO: $pathToRemove');
    final result = await _supabase.storage.from(_bucketName).remove([
      pathToRemove,
    ]);
    return result;
  }

  // Create Folder
  Future<String> createFolder(
    String path,
    String folderName,
    Uint8List bytes,
  ) async {
    final pathNewFolder = path.isEmpty
        ? "$folderName/.emptyFolderPlaceholder"
        : '$path/$folderName/.emptyFolderPlaceholder';
    await _supabase.storage
        .from(_bucketName)
        .uploadBinary(
          pathNewFolder,
          bytes,
          fileOptions: const FileOptions(upsert: true),
        );
    return folderName;
  }

  // Delete a file from the bucket
  Future<List<FileObject>> deleteFolder(String path, String folderName) async {
    // Remove the "/" after "$path" if path is empty (root folder)
    final pathToRemove = path.isEmpty
        ? '$folderName/.emptyFolderPlaceholder'
        : '$path/$folderName/.emptyFolderPlaceholder';
    // Delete folder
    final result = await _supabase.storage.from(_bucketName).remove([
      pathToRemove,
    ]);
    return result;
  }
}
