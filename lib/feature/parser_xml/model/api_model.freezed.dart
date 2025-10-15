// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiModel {

 String get api; String get apiName; Method get method;
/// Create a copy of ApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiModelCopyWith<ApiModel> get copyWith => _$ApiModelCopyWithImpl<ApiModel>(this as ApiModel, _$identity);

  /// Serializes this ApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiModel&&(identical(other.api, api) || other.api == api)&&(identical(other.apiName, apiName) || other.apiName == apiName)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,apiName,method);

@override
String toString() {
  return 'ApiModel(api: $api, apiName: $apiName, method: $method)';
}


}

/// @nodoc
abstract mixin class $ApiModelCopyWith<$Res>  {
  factory $ApiModelCopyWith(ApiModel value, $Res Function(ApiModel) _then) = _$ApiModelCopyWithImpl;
@useResult
$Res call({
 String api, String apiName, Method method
});




}
/// @nodoc
class _$ApiModelCopyWithImpl<$Res>
    implements $ApiModelCopyWith<$Res> {
  _$ApiModelCopyWithImpl(this._self, this._then);

  final ApiModel _self;
  final $Res Function(ApiModel) _then;

/// Create a copy of ApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? apiName = null,Object? method = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,apiName: null == apiName ? _self.apiName : apiName // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as Method,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiModel].
extension ApiModelPatterns on ApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiModel value)  $default,){
final _that = this;
switch (_that) {
case _ApiModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String apiName,  Method method)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiModel() when $default != null:
return $default(_that.api,_that.apiName,_that.method);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String apiName,  Method method)  $default,) {final _that = this;
switch (_that) {
case _ApiModel():
return $default(_that.api,_that.apiName,_that.method);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String apiName,  Method method)?  $default,) {final _that = this;
switch (_that) {
case _ApiModel() when $default != null:
return $default(_that.api,_that.apiName,_that.method);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiModel implements ApiModel {
  const _ApiModel({required this.api, required this.apiName, required this.method});
  factory _ApiModel.fromJson(Map<String, dynamic> json) => _$ApiModelFromJson(json);

@override final  String api;
@override final  String apiName;
@override final  Method method;

/// Create a copy of ApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiModelCopyWith<_ApiModel> get copyWith => __$ApiModelCopyWithImpl<_ApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiModel&&(identical(other.api, api) || other.api == api)&&(identical(other.apiName, apiName) || other.apiName == apiName)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,apiName,method);

@override
String toString() {
  return 'ApiModel(api: $api, apiName: $apiName, method: $method)';
}


}

/// @nodoc
abstract mixin class _$ApiModelCopyWith<$Res> implements $ApiModelCopyWith<$Res> {
  factory _$ApiModelCopyWith(_ApiModel value, $Res Function(_ApiModel) _then) = __$ApiModelCopyWithImpl;
@override @useResult
$Res call({
 String api, String apiName, Method method
});




}
/// @nodoc
class __$ApiModelCopyWithImpl<$Res>
    implements _$ApiModelCopyWith<$Res> {
  __$ApiModelCopyWithImpl(this._self, this._then);

  final _ApiModel _self;
  final $Res Function(_ApiModel) _then;

/// Create a copy of ApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? apiName = null,Object? method = null,}) {
  return _then(_ApiModel(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,apiName: null == apiName ? _self.apiName : apiName // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as Method,
  ));
}


}

// dart format on
