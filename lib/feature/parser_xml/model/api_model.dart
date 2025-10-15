import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';

part 'api_model.g.dart';

@freezed
sealed class ApiModel with _$ApiModel {
  const factory ApiModel({
    required String api,
    required String apiName,
    required Method method,
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, Object?> json) =>
      _$ApiModelFromJson(json);
}

enum Method {
  get(color: Color.fromRGBO(69, 156, 103, 1.0)),
  post(color: Color.fromRGBO(174, 124, 9, 1.0)),
  put(color: Color.fromRGBO(55, 120, 198, 1.0)),
  patch(color: Color.fromRGBO(145, 111, 183, 1.0)),
  delete(color: Color.fromRGBO(165, 66, 57, 1.0)),
  options(color: Color.fromRGBO(172, 52, 122, 1.0)),
  head(color: Color.fromRGBO(31, 141, 73, 1.0)),
  trace(color: Color.fromRGBO(118, 180, 234, 1.0)),
  connect(color: Color.fromRGBO(174, 147, 197, 1.0));

  const Method({required this.color});

  final Color color;
}
