part of 'create_api_cubit.dart';

@freezed
sealed class CreateApiState with _$CreateApiState {
  const factory CreateApiState({
    final String? result,
    final InfoMex? infoMex,
  }) = _CreateApiState;

  static CreateApiState initState() => const CreateApiState(
    result: null,
    infoMex: null,
  );
}


