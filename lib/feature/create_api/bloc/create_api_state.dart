part of 'create_api_cubit.dart';

@freezed
sealed class CreateApiState with _$CreateApiState {
  const factory CreateApiState({
    String? result,
    String? errorMex,
  }) = _CreateApiState;

  static CreateApiState initState() => const CreateApiState(
    result: null,
    errorMex: null,
  );
}


