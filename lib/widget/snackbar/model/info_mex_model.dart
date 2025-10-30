import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_mex_model.freezed.dart';

@freezed
sealed class InfoMex with _$InfoMex {
  const factory InfoMex({required String mex, required MexType type}) =
      _InfoMex;
}

enum MexType { info, error, warning, success }
