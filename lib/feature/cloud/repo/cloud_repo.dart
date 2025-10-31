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
  Future<List<FileObject>> listFiles() async {
    List<FileObject> response = [];
    try {
      response = await _supabase.storage
          .from(_bucketName)
          .list(path: 'uploads');
    } catch (e) {
      log('CLOUD_REPO_ERROR: Errore nel recupero dei file.\n$e');
      throw Exception('Errore nel recupero dei file: $e');
    }
    return response;
  }

  // Download file frpm get the URL of a file in the bucket
  Future<String> getFileUrl(String fileName) async {
    try {
      final url = await _supabase.storage
          .from(_bucketName)
          .createSignedUrl('uploads/$fileName', 60);

      return url;
    } catch (e) {
      throw Exception('Errore nel recupero dell\'URL del file: $e');
    }
  }

  // Download a file from the bucket
  Future<Uint8List> downloadFile(String fileName) async {
    try {
      final result = await _supabase.storage
          .from(_bucketName)
          .download('uploads/$fileName');
      return result;
    } catch (e) {
      throw Exception('Errore nel caricamento del file: $e');
    }
  }

  // Upload a file to the bucket
  Future<String> uploadFile(String fileName, Uint8List bytes) async {
    try {
      await _supabase.storage
          .from(_bucketName)
          .uploadBinary(
            'uploads/$fileName',
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );
      return fileName;
    } catch (e) {
      throw Exception('Errore nel caricamento del file: $e');
    }
  }

  // Delete a file from the bucket
  Future<List<FileObject>> deleteFile(String fileName) async {
    try {
      final result = await _supabase.storage.from(_bucketName).remove([
        'uploads/$fileName',
      ]);
      return result;
    } catch (e) {
      log('CLOUD_REPO_ERROR: Errore nell\'eliminazione del file.\n$e');
      throw Exception('Errore nell\'eliminazione del file: $e');
    }
  }
}
