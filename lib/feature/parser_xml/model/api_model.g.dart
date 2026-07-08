// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => _ApiModel(
  api: json['api'] as String,
  apiName: json['apiName'] as String,
  method: $enumDecode(_$MethodEnumMap, json['method']),
  prodCond: json['prodCond'] as bool? ?? false,
);

Map<String, dynamic> _$ApiModelToJson(_ApiModel instance) => <String, dynamic>{
  'api': instance.api,
  'apiName': instance.apiName,
  'method': _$MethodEnumMap[instance.method]!,
  'prodCond': instance.prodCond,
};

const _$MethodEnumMap = {
  Method.get: 'get',
  Method.post: 'post',
  Method.put: 'put',
  Method.patch: 'patch',
  Method.delete: 'delete',
};
