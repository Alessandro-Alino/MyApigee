import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'package:myapigee/feature/cloud/model/file_upload_model.dart';
import 'package:myapigee/feature/cloud/repo/cloud_error_handler.dart';
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
      log('[PATH] $normPath');
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
      final error = CloudErrorHandler.handle(e);
      // Show Error
      _showMex(mex: error, type: MexType.error);
      log('[CLOUD_BLOC] Errore nel recupero dei file: $error');
    }
  }

  // Download
  Future<void> downloadFileFromWeb(FileObject file) async {
    try {
      emit(state.copyWith(isNetworking: true, networkingFileId: file.id));
      // Normalized Path
      final normPath = state.breadcrumb.join('/');
      final fileBytes = await cloudRepo.downloadFile(normPath, file.name);
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
          networkingProgress: 0.0,
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
      // Normalized Path
      final normPath = state.breadcrumb.join('/');
      final fileURL = await cloudRepo.getFileUrl(normPath, file.name);

      if (downloadDir != null) {
        await appDio.download(
          fileURL,
          '${downloadDir.path}/MyApigee/${file.name}',
          onReceiveProgress: (receivedBytes, totalBytes) {
            if (totalBytes != -1) {
              final progress = receivedBytes / totalBytes;
              emit(state.copyWith(networkingProgress: progress));
            }
          },
        );
        // Download Complete
        emit(
          state.copyWith(
            isNetworking: false,
            networkingFileId: null,
            networkingProgress: 0.0,
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final List<FileUploadModel> fileUploads = [];
      // Iterate over the selected files
      for (var file in result.files) {
        // Create a FileUploadModel with the selected file
        final FileUploadModel fileUploadModel = FileUploadModel(
          fileUpload: File(file.path!),
          fileName: file.name,
        );
        // Add to fileUploads
        fileUploads.add(fileUploadModel);
      }

      emit(state.copyWith(fileUploads: fileUploads));
    } else {
      log('Nessun file selezionato');
    }
  }

  // Deselect File
  void deselectFileUpload(FileUploadModel fileToRemove) {
    final updatedFileUploads = List<FileUploadModel>.from(state.fileUploads);
    updatedFileUploads.remove(fileToRemove);

    emit(state.copyWith(fileUploads: updatedFileUploads));
  }

  // Upload
  Future<void> uploadFiles() async {
    // Se non ci sono file, mostra un messaggio e esci
    if (state.fileUploads.isEmpty) {
      _showMex(mex: '[CLOUD_BLOC] Nessun file selezionato', type: MexType.info);
      return;
    }

    final updatedFiles = List<FileUploadModel>.from(state.fileUploads);

    // Iterate over the selected files
    for (int i = 0; i < updatedFiles.length; i++) {
      final fileUploadModel = updatedFiles[i];

      // Start upload and set Loading
      updatedFiles[i] = fileUploadModel.copyWith(
        fileUploadStatus: FileUploadStatus.loading,
      );
      emit(state.copyWith(fileUploads: updatedFiles));

      try {
        // Read the file as bytes
        final bytes = await fileUploadModel.fileUpload.readAsBytes();
        // Normalized Path
        final normPath = state.breadcrumb.join('/');
        // Upload the file to Supabase with progress
        await cloudRepo.uploadFile(normPath, fileUploadModel.fileName, bytes);

        // Update Status
        updatedFiles[i] = fileUploadModel.copyWith(
          fileUploadStatus: FileUploadStatus.success,
        );

        emit(state.copyWith(fileUploads: List.from(updatedFiles)));

        // updatedFiles[i] = fileUploadModel.copyWith(uploadedUrl: fileUrl);
      } on DioException catch (e) {
        // Gestione dell'errore
        dioErrMex(e);
        log(
          '[DIO_EXPT] Errore durante l\'upload di ${fileUploadModel.fileName}: $e',
        );

        // Aggiorna lo stato del file a "error"
        updatedFiles[i] = fileUploadModel.copyWith(
          fileUploadStatus: FileUploadStatus.error,
        );

        emit(state.copyWith(fileUploads: List.from(updatedFiles)));
      } catch (e) {
        // Gestione di altri errori
        log(
          '[CLOUD_BLOC] Errore durante l\'upload di ${fileUploadModel.fileName}: $e',
        );

        // Aggiorna lo stato del file a "error"
        updatedFiles[i] = fileUploadModel.copyWith(
          fileUploadStatus: FileUploadStatus.error,
        );

        emit(state.copyWith(fileUploads: List.from(updatedFiles)));
      }
    }

    // Reload List
    if (state.breadcrumb.isEmpty) {
      loadFiles();
    } else {
      loadFiles(
        path: state.breadcrumb.last,
        index: state.breadcrumb.length - 1,
      );
    }

    // // Rimuovi i file caricati con successo dalla selezione
    // for (final fileModel in updatedFiles.where(
    //   (f) => f.fileUploadStatus == FileUploadStatus.success,
    // )) {
    //   deselectFileUpload(fileModel);
    // }
  }

  // Create Folder with an empty file placeholder
  Future<void> createFolder(String nameFolder) async {
    // Normalized Path
    final normPath = state.breadcrumb.join('/');
    // Folder Name
    final folderName = nameFolder.trim();
    // Generate empty File
    final bytes = Uint8List(0);

    // Create Folder
    try {
      final result = await cloudRepo.createFolder(normPath, folderName, bytes);
      log(result.toString());
      if (state.breadcrumb.isEmpty) {
        loadFiles().then((e) {
          _showMex(mex: 'Cartella creata', type: MexType.success);
        });
      } else {
        loadFiles(
          path: state.breadcrumb.last,
          index: state.breadcrumb.length - 1,
        ).then((e) {
          _showMex(mex: 'Cartella creata', type: MexType.success);
        });
      }
    } catch (e) {
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante la creazione della cartella: $e',
        type: MexType.error,
      );
    }
  }

  // Delete file from bucket
  Future<void> deleteFile(FileObject file) async {
    try {
      // Normalized Path
      final normPath = state.breadcrumb.join('/');
      await cloudRepo.deleteFile(normPath, file.name);

      if (state.breadcrumb.isEmpty) {
        loadFiles().then((e) {
          _showMex(mex: 'Eliminato', type: MexType.success);
        });
      } else {
        loadFiles(
          path: state.breadcrumb.last,
          index: state.breadcrumb.length - 1,
        ).then((e) {
          _showMex(mex: 'Eliminato', type: MexType.success);
        });
      }
    } catch (e) {
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante la cancellazione del file: $e',
        type: MexType.error,
      );
    }
  }

  // Delete file from bucket
  Future<void> deleteFolder(String folderName) async {
    // Normalized Path
    final normPath = state.breadcrumb.join('/');
    try {
      await cloudRepo.deleteFolder(normPath, folderName);
      if (state.breadcrumb.isEmpty) {
        loadFiles().then((e) {
          _showMex(mex: 'Eliminato', type: MexType.success);
        });
      } else {
        loadFiles(
          path: state.breadcrumb.last,
          index: state.breadcrumb.length - 1,
        ).then((e) {
          _showMex(mex: 'Eliminato', type: MexType.success);
        });
      }
    } catch (e) {
      _showMex(
        mex: '[CLOUD_BLOC] Errore durante la cancellazione della cartella: $e',
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
        networkingProgress: 0.0,
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
