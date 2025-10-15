// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => _ApiModel(
  api: json['api'] as String,
  apiName: json['apiName'] as String,
  method: $enumDecode(_$MethodEnumMap, json['method']),
);

Map<String, dynamic> _$ApiModelToJson(_ApiModel instance) => <String, dynamic>{
  'api': instance.api,
  'apiName': instance.apiName,
  'method': _$MethodEnumMap[instance.method]!,
};

const _$MethodEnumMap = {
  Method.get: 'get',
  Method.post: 'post',
  Method.put: 'put',
  Method.patch: 'patch',
  Method.delete: 'delete',
  Method.options: 'options',
  Method.head: 'head',
  Method.trace: 'trace',
  Method.connect: 'connect',
};
