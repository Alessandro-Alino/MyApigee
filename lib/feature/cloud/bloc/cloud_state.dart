part of 'cloud_cubit.dart';

@freezed
sealed class CloudState with _$CloudState {
  const factory CloudState({
    String? errorMex,
  }) = _CloudState;

  static CloudState initState() => const CloudState(
    errorMex: null,
  );
}
