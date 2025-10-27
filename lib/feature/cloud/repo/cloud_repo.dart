import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class CloudRepo {
  final SupabaseClient _supabase;
  final String bucketName;

  CloudRepo({required SupabaseClient supabase, required this.bucketName})
    : _supabase = supabase;

  /// Recupera la lista di tutti i file nel bucket
  Future<void> listFiles() async {
    try {
      final response = await _supabase.storage.from(bucketName).list();
      log(response.toString());
    } catch (e) {
      throw Exception('Errore nel recupero dei file: $e');
    }
  }

  /// Carica un file nel bucket Supabase
  Future<String> uploadFile(String filePath) async {
    try {
      final file = File(filePath);
      final fileName = file.path.split('/').last;
      final bytes = await file.readAsBytes();

      await _supabase.storage
          .from(bucketName)
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );

      return fileName;
    } catch (e) {
      throw Exception('Errore nel caricamento del file: $e');
    }
  }

  /// Scarica un file dal bucket e lo salva localmente
  Future<String> downloadFile(String fileName, String savePath) async {
    try {
      final bytes = await _supabase.storage.from(bucketName).download(fileName);

      final file = File('$savePath/$fileName');
      await file.writeAsBytes(bytes);

      return file.path;
    } catch (e) {
      throw Exception('Errore nello scaricamento del file: $e');
    }
  }

  /// Elimina un file dal bucket
  Future<void> deleteFile(String fileName) async {
    try {
      await _supabase.storage.from(bucketName).remove([fileName]);
    } catch (e) {
      throw Exception('Errore nell\'eliminazione del file: $e');
    }
  }

  /// Ottiene l'URL pubblico di un file
  String getPublicUrl(String fileName) {
    return _supabase.storage.from(bucketName).getPublicUrl(fileName);
  }
}
