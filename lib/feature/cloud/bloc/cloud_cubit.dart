import 'package:file_saver/file_saver.dart';
import 'package:myapigee/feature/cloud/repo/error_interceptor.dart';
import 'package:myapigee/feature/cloud/utils/cloud_item.dart';
import 'package:universal_io/io.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapigee/feature/cloud/repo/cloud_repo.dart';
import 'package:myapigee/feature/cloud/repo/dio_repo.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cloud_state.dart';

part 'cloud_cubit.freezed.dart';

class CloudCubit extends Cubit<CloudState> {
  CloudCubit({required this.cloudRepo}) : super(CloudState.initState()) {
    loadFiles();
  }

  final CloudRepo cloudRepo;
  CloudStatus _preStatus = CloudStatus.initial;
  Dio appDio = AppDio().dio;

  // Set Breadcrumb
  String _setBreadcrumb(String? path, int? index) {
    // Get Breadcrumb from state
    List<String> breadcrumb = List.from(state.breadcrumb);
    // If path is null, return empty path
    if (path == null) {
      emit(state.copyWith(breadcrumb: const []));
      return '';
    }
    // Set Breadcrumb by index
    if (index != null) {
      breadcrumb = breadcrumb.sublist(0, index + 1);
      emit(state.copyWith(breadcrumb: breadcrumb));
      // Normalized Path
      final normPath = breadcrumb.join('/');
      return normPath;
    }
    // Set Breadcrumb
    else {
      // Add path to breadcrumb
      breadcrumb = breadcrumb..add(path);
      emit(state.copyWith(breadcrumb: breadcrumb));
      // Normalized Path
      final normPath = breadcrumb.join('/');
      return normPath;
    }
  }

  // refresh BreadCrumb
  void refreshBreadcrumb({int? index}) {
    if (index == null) {
      loadFiles();
    } else {
      loadFiles(path: state.breadcrumb[index], index: index);
    }
  }

  // Read the file from the bucket
  Future<void> loadFiles({String? path, int? index}) async {
    List<CloudItem> cloudItems = [];
    _loading();

    try {
      final String normPath = _setBreadcrumb(path, index);
      // Get files from bucket
      final result = await cloudRepo.listFiles(path: normPath);
      // Clean result and convert into CloudItem
      final cleanResult = result
          .where((e) => !e.name.startsWith('.'))
          .map((e) => CloudItem(file: e))
          .toList();
      cloudItems.addAll(cleanResult);
      // Order by folder
      cloudItems.sort(
        (a, b) => b.isFolder.toString().compareTo(a.isFolder.toString()),
      );
      // Emit State
      emit(state.copyWith(status: CloudStatus.success, files: cloudItems));
    } catch (e) {
      // Show Error
      _showMex(
        mex: '[CLOUD_BLOC] Errore nel recupero dei file: $e',
        type: MexType.error,
      );
    }
  }

  // Download
  Future<void> downloadFileFromWeb(FileObject file) async {
    try {
      emit(state.copyWith(isNetworking: true, networkingFileId: file.id));
      final fileBytes = await cloudRepo.downloadFile(file.name);
      //download File on WEB
      final download = await FileSaver.instance.saveFile(
        name: file.name,
        bytes: fileBytes,
      );
      log('Result download: $download');
      // Download Complete
      emit(
        state.copyWith(
          isNetworking: false,
          networkingFileId: null,
          networkinProgress: 0.0,
        ),
      );
      _showMex(mex: 'Download Completato', type: MexType.success);
    } on DioException catch (e) {
      final String dioErr = dioErrMex(e);
      log('[DIO_EXPT] Errore durante il download: $e');
      _showMex(mex: dioErr, type: MexType.error);
    } catch (e) {
      log('[CLOUD_BLOC] Errore durante il download: $e');
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante il download: $e',
        type: MexType.error,
      );
    }
  }

  // Download with Progress
  Future<void> downloadFileWithProgress(FileObject file) async {
    try {
      emit(state.copyWith(isNetworking: true, networkingFileId: file.id));
      final downloadDir = await getDownloadsDirectory();
      final fileURL = await cloudRepo.getFileUrl(file.name);

      if (downloadDir != null) {
        await appDio.download(
          fileURL,
          '${downloadDir.path}/MyApigee/${file.name}',
          onReceiveProgress: (receivedBytes, totalBytes) {
            if (totalBytes != -1) {
              final progress = receivedBytes / totalBytes;
              emit(state.copyWith(networkinProgress: progress));
            }
          },
        );
        // Download Complete
        emit(
          state.copyWith(
            isNetworking: false,
            networkingFileId: null,
            networkinProgress: 0.0,
          ),
        );
        _showMex(mex: 'Download Completato', type: MexType.success);
      } else {
        _showMex(
          mex: '[CLOUD_BLOC] Errore nel download del file. (No Download PATH):',
          type: MexType.error,
        );
      }
    } on DioException catch (e) {
      final String dioErr = dioErrMex(e);
      log('[DIO_EXPT] Errore durante il download: $e');
      _showMex(mex: dioErr, type: MexType.error);
    } catch (e) {
      log('[CLOUD_BLOC] Errore durante il download: $e');
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante il download: $e',
        type: MexType.error,
      );
    }
  }

  // Select File to Upload
  Future<void> selectFileUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final File file = File(result.files.single.path!);
      final String fileName = result.files.single.name;

      emit(
        state.copyWith(
          selectedFileUpload: file,
          selectedFileUploadName: fileName,
        ),
      );
    } else {
      log('Nessun file selezionato');
    }
  }

  // Deselect File
  void deselectFileUpload() {
    emit(
      state.copyWith(selectedFileUpload: null, selectedFileUploadName: null),
    );
  }

  // Upload
  Future<void> uploadFile() async {
    // If no file, return
    if (state.selectedFileUpload == null) {
      _showMex(mex: '[CLOUD_BLOC] Nessun file selezionato', type: MexType.info);
    } else {
      final fileName = state.selectedFileUploadName;
      final bytes = await state.selectedFileUpload?.readAsBytes();

      if (fileName != null && bytes != null) {
        try {
          emit(state.copyWith(isNetworking: true));
          final fileURL = await cloudRepo.uploadFile(fileName, bytes);
          log('[CLOUD_BLOC] REPO_UPLOAD: $fileURL');
          // Upload Complete
          loadFiles();
          deselectFileUpload();
          _showMex(mex: 'Upload Completato', type: MexType.success);
          emit(state.copyWith(isNetworking: false));
        } on DioException catch (e) {
          deselectFileUpload();
          final String dioErr = dioErrMex(e);
          log('[DIO_EXPT] Errore durante  l\'upload: $e');
          _showMex(mex: dioErr, type: MexType.error);
        } catch (e) {
          log('[CLOUD_BLOC] Errore durante  l\'upload: $e');
          deselectFileUpload();
          _showMex(
            mex: '[CLOUD_BLOC] Errore durante  l\'upload: $e',
            type: MexType.error,
          );
        }
      } else {
        deselectFileUpload();
        _showMex(
          mex: '[CLOUD_BLOC] Errore generico durante l\'upload',
          type: MexType.error,
        );
      }
    }
  }

  // Delete file from bucket
  Future<void> deleteFile(FileObject file) async {
    try {
      final result = await cloudRepo.deleteFile(file.name);
      log(result.toString());
      loadFiles().then((e) {
        _showMex(mex: 'Eliminato', type: MexType.success);
      });
    } catch (e) {
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante la cancellazione del file: $e',
        type: MexType.error,
      );
    }
  }

  // Loading State
  void _loading() {
    _preStatus = state.status;
    emit(state.copyWith(status: CloudStatus.loading));
  }

  // Show Message
  void _showMex({required String mex, required MexType type}) {
    emit(
      state.copyWith(
        infoMex: InfoMex(mex: mex, type: type),
        isNetworking: false,
        networkingFileId: null,
        networkinProgress: 0.0,
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(status: _preStatus, infoMex: null));
    });
  }

  // Init
  void init() {
    emit(CloudState.initState());
  }
}
