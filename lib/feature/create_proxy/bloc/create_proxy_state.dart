part of 'create_proxy_cubit.dart';

@freezed
sealed class CreateProxyState with _$CreateProxyState {
  const factory CreateProxyState({
    @Default(CreateProxyStatus.initial) CreateProxyStatus status,
    @Default('') String outputPath,
    @Default('') String rawText,
    @Default('') String env,
    @Default('') String countryCode,
    @Default('') String proxyName,
    @Default('') String basepathProxy,
    @Default('') String basepathTarget,
    @Default('') String targetName,
    @Default('') String repoName,
    @Default('') String repoTargetName,
    @Default(GCP.milan) GCP gcp,
    final InfoMex? infoMex,
  }) = _CreateProxyState;

  static CreateProxyState initState() => const CreateProxyState(
    status: CreateProxyStatus.initial,
    outputPath: '',
    rawText: '',
    env: '',
    countryCode: '',
    gcp: GCP.milan,
    proxyName: '',
    basepathProxy: '',
    basepathTarget: '',
    targetName: '',
    repoName: '',
    repoTargetName: '',
    infoMex: null,
  );
}

enum CreateProxyStatus { initial, loading, success, error }