import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapigee/feature/create_proxy/repo/create_proxy_repo.dart';
import 'package:myapigee/feature/create_proxy/utils/gcp_data.dart';
import 'package:myapigee/widget/snackbar/model/info_mex_model.dart';
import 'package:universal_io/universal_io.dart';

part 'create_proxy_state.dart';

part 'create_proxy_cubit.freezed.dart';

class CreateProxyCubit extends Cubit<CreateProxyState> {
  CreateProxyCubit({required this.createProxyRepo})
    : super(CreateProxyState.initState());

  final CreateProxyRepo createProxyRepo;
  final CreateProxyStatus _preStatus = CreateProxyStatus.initial;

  // Choose Output Path
  Future<void> chooseOutputPath() async {
    final String? outputPath = await FilePicker.platform.getDirectoryPath();

    if (outputPath == null) {
      _showMex(mex: 'Nessun percorso selezionato', type: MexType.error);
    } else {
      await createProxyRepo.saveOutputPath(outputPath);
      emit(state.copyWith(outputPath: outputPath));
      _showMex(mex: 'Percorso salvato', type: MexType.success);
    }
  }

  // Get Output Path
  void getOutputPath() {
    String? outputPath = createProxyRepo.getOutputPath();
    if (outputPath == null) {
      return;
    } else {
      emit(state.copyWith(outputPath: outputPath));
    }
  }

  // Set GCP
  void setGCP(GCP gcp) {
    _updateState(newGCP: gcp);
  }

  // Set Env
  void setEnv(String env) {
    _updateState(newEnv: env);
  }

  // Set CountryCode
  void setCountryCode(String countryCode) {
    _updateState(newCountry: countryCode);
  }

  // Set Basepath proxy
  void setBasepathProxy(String basepathProxy) {
    _updateState(newBasepathProxy: basepathProxy);
  }

  // Set Basepath target
  void setBasepathTarget(String basepathTarget) {
    _updateState(newBasepathTarget: basepathTarget);
  }

  // Set RawText
  void setRawText(String rawText) {
    _updateState(newRawText: rawText);
  }

  void _updateState({
    String? newEnv,
    String? newCountry,
    String? newRawText,
    String? newBasepathProxy,
    String? newBasepathTarget,
    GCP? newGCP,
  }) {
    final env = (newEnv ?? state.env).toLowerCase();
    final countryCode = (newCountry ?? state.countryCode).toLowerCase();
    final gcp = (newGCP ?? state.gcp);
    final rawText = (newRawText ?? state.rawText).toLowerCase();
    final basepathProxy = (newBasepathProxy ?? state.basepathProxy)
        .toLowerCase();
    final basepathTarget = (newBasepathTarget ?? state.basepathTarget)
        .toLowerCase();

    emit(
      state.copyWith(
        status: CreateProxyStatus.success,
        env: env,
        countryCode: countryCode,
        rawText: rawText,
        gcp: gcp,
        proxyName: 'api-$env-${gcp.prefix}$countryCode-$rawText',
        targetName: 'tgs-$env-${gcp.prefix}$countryCode-$rawText',
        repoName: 'apigee-api-$env-${gcp.prefix}$rawText-$countryCode',
        repoTargetName: 'apigee-tgs-$env-${gcp.prefix}$rawText-$countryCode',
        basepathProxy: basepathProxy.startsWith('/') ? basepathProxy : '/$basepathProxy',
        basepathTarget: basepathTarget.startsWith('/') ? basepathTarget : '/$basepathTarget',
      ),
    );
  }

  Future<void> generateProject() async {
    _showMex(mex: 'Generazione in corso...', type: MexType.info);

    // Get the right project and configs
    final GCPprj gcpPRJ = GCPprj.values.byName(state.env);

    try {
      // Create Folders and file
      await Future.wait([
        _createFolder(gcpPRJ.config.proxyFiles),
        _createFolder(gcpPRJ.config.proxyFilesToCopy, onlyCopy: true),
        _createFolder(gcpPRJ.config.targetFiles, target: true),
        _createFolder(
          gcpPRJ.config.targetFilesToCopy,
          target: true,
          onlyCopy: true,
        ),
      ]);

      _showMex(mex: 'Completato!', type: MexType.success);
    } catch (e) {
      _showMex(mex: 'Errore: $e', type: MexType.error);
      log('[BLOC ERROR 01]: $e');
    }
  }

  Future<void> _createFolder(
    List<String> files, {
    bool target = false,
    bool onlyCopy = false,
  }) async {
    // Asset folder
    final String assetFolder = target ? 'target' : 'proxy';

    // Output folder
    final String outputFolder =
        '${state.outputPath}/${target ? state.repoTargetName : state.repoName}';

    for (final file in files) {
      // Read the content file from Asset
      final String assetPath =
          'assets/template/$assetFolder/${state.env}/$file';
      // Rename file with variable name
      String fileName = _replaceVariables(file);
      // Only copy
      if (onlyCopy) {
        // Read the byte from Assets for better performance
        ByteData byteData = await rootBundle.load(assetPath);
        // Copy the file in the output folder
        final destFile = File('$outputFolder/$fileName');
        await destFile.parent.create(recursive: true);
        final Uint8List data = byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        );
        await destFile.writeAsBytes(data);
      }
      // Replace varibles
      else {
        // Read the content file from Assets
        String content = await rootBundle.loadString(assetPath);

        // Replace variables in the Readable content
        content = _replaceVariables(content);
        // Create the file in the output folder
        final destFile = File('$outputFolder/$fileName');
        await destFile.parent.create(recursive: true);
        await destFile.writeAsString(content);
      }
    }
  }

  String _replaceVariables(String content) {
    return content
        .replaceAll('{proxyCustomName}', state.proxyName)
        .replaceAll('{basepathProxy}', state.basepathProxy)
        .replaceAll('{basepathTarget}', state.basepathTarget)
        .replaceAll('{targetCustomName}', state.targetName)
        .replaceAll('{repoName}', state.repoName)
        .replaceAll('{repoTargetName}', state.repoTargetName)
        .replaceAll('{rawText}', state.rawText)
        .replaceAll('{env}', state.env)
        .replaceAll('{envUpperCase}', state.env.toUpperCase())
        .replaceAll('{countryCode}', state.countryCode)
        .replaceAll('{countryCodeUpperCase}', state.countryCode.toUpperCase())
        .replaceAll('{gcpSIT}', state.gcp.sit)
        .replaceAll('{gcpUAT}', state.gcp.uat)
        .replaceAll('{gcpPRD}', state.gcp.prd)
        .replaceAll('{gcpPRDEXT}', state.gcp.prdExt ?? '');
  }

  // // Loading State
  // void _loading() {
  //   _preStatus = state.status;
  //   emit(state.copyWith(status: CreateProxyStatus.loading));
  // }

  // Show Message
  void _showMex({required String mex, required MexType type}) {
    emit(
      state.copyWith(
        infoMex: InfoMex(mex: mex, type: type),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(status: _preStatus, infoMex: null));
    });
  }

  // Init
  void init({bool reset = false}) {
    reset
        ? emit(CreateProxyState.initState())
        : emit(
            state.copyWith(
              status: CreateProxyStatus.initial,
              countryCode: '',
              env: '',
              proxyName: '',
              basepathProxy: '',
              basepathTarget: '',
              targetName: '',
              repoName: '',
              repoTargetName: '',
              gcp: GCP.milan,
              rawText: '',
              infoMex: null,
            ),
          );
  }
}
