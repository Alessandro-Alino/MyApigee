// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_proxy_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProxyState {

 CreateProxyStatus get status; String get outputPath; String get rawText; String get env; String get countryCode; String get proxyName; String get basepathProxy; String get basepathTarget; String get targetName; String get repoName; String get repoTargetName; GCP get gcp; InfoMex? get infoMex;
/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProxyStateCopyWith<CreateProxyState> get copyWith => _$CreateProxyStateCopyWithImpl<CreateProxyState>(this as CreateProxyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProxyState&&(identical(other.status, status) || other.status == status)&&(identical(other.outputPath, outputPath) || other.outputPath == outputPath)&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.env, env) || other.env == env)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName)&&(identical(other.basepathProxy, basepathProxy) || other.basepathProxy == basepathProxy)&&(identical(other.basepathTarget, basepathTarget) || other.basepathTarget == basepathTarget)&&(identical(other.targetName, targetName) || other.targetName == targetName)&&(identical(other.repoName, repoName) || other.repoName == repoName)&&(identical(other.repoTargetName, repoTargetName) || other.repoTargetName == repoTargetName)&&(identical(other.gcp, gcp) || other.gcp == gcp)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,outputPath,rawText,env,countryCode,proxyName,basepathProxy,basepathTarget,targetName,repoName,repoTargetName,gcp,infoMex);

@override
String toString() {
  return 'CreateProxyState(status: $status, outputPath: $outputPath, rawText: $rawText, env: $env, countryCode: $countryCode, proxyName: $proxyName, basepathProxy: $basepathProxy, basepathTarget: $basepathTarget, targetName: $targetName, repoName: $repoName, repoTargetName: $repoTargetName, gcp: $gcp, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class $CreateProxyStateCopyWith<$Res>  {
  factory $CreateProxyStateCopyWith(CreateProxyState value, $Res Function(CreateProxyState) _then) = _$CreateProxyStateCopyWithImpl;
@useResult
$Res call({
 CreateProxyStatus status, String outputPath, String rawText, String env, String countryCode, String proxyName, String basepathProxy, String basepathTarget, String targetName, String repoName, String repoTargetName, GCP gcp, InfoMex? infoMex
});


$InfoMexCopyWith<$Res>? get infoMex;

}
/// @nodoc
class _$CreateProxyStateCopyWithImpl<$Res>
    implements $CreateProxyStateCopyWith<$Res> {
  _$CreateProxyStateCopyWithImpl(this._self, this._then);

  final CreateProxyState _self;
  final $Res Function(CreateProxyState) _then;

/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? outputPath = null,Object? rawText = null,Object? env = null,Object? countryCode = null,Object? proxyName = null,Object? basepathProxy = null,Object? basepathTarget = null,Object? targetName = null,Object? repoName = null,Object? repoTargetName = null,Object? gcp = null,Object? infoMex = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateProxyStatus,outputPath: null == outputPath ? _self.outputPath : outputPath // ignore: cast_nullable_to_non_nullable
as String,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,env: null == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,basepathProxy: null == basepathProxy ? _self.basepathProxy : basepathProxy // ignore: cast_nullable_to_non_nullable
as String,basepathTarget: null == basepathTarget ? _self.basepathTarget : basepathTarget // ignore: cast_nullable_to_non_nullable
as String,targetName: null == targetName ? _self.targetName : targetName // ignore: cast_nullable_to_non_nullable
as String,repoName: null == repoName ? _self.repoName : repoName // ignore: cast_nullable_to_non_nullable
as String,repoTargetName: null == repoTargetName ? _self.repoTargetName : repoTargetName // ignore: cast_nullable_to_non_nullable
as String,gcp: null == gcp ? _self.gcp : gcp // ignore: cast_nullable_to_non_nullable
as GCP,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
as InfoMex?,
  ));
}
/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoMexCopyWith<$Res>? get infoMex {
    if (_self.infoMex == null) {
    return null;
  }

  return $InfoMexCopyWith<$Res>(_self.infoMex!, (value) {
    return _then(_self.copyWith(infoMex: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateProxyState].
extension CreateProxyStatePatterns on CreateProxyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProxyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProxyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProxyState value)  $default,){
final _that = this;
switch (_that) {
case _CreateProxyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProxyState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProxyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateProxyStatus status,  String outputPath,  String rawText,  String env,  String countryCode,  String proxyName,  String basepathProxy,  String basepathTarget,  String targetName,  String repoName,  String repoTargetName,  GCP gcp,  InfoMex? infoMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProxyState() when $default != null:
return $default(_that.status,_that.outputPath,_that.rawText,_that.env,_that.countryCode,_that.proxyName,_that.basepathProxy,_that.basepathTarget,_that.targetName,_that.repoName,_that.repoTargetName,_that.gcp,_that.infoMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateProxyStatus status,  String outputPath,  String rawText,  String env,  String countryCode,  String proxyName,  String basepathProxy,  String basepathTarget,  String targetName,  String repoName,  String repoTargetName,  GCP gcp,  InfoMex? infoMex)  $default,) {final _that = this;
switch (_that) {
case _CreateProxyState():
return $default(_that.status,_that.outputPath,_that.rawText,_that.env,_that.countryCode,_that.proxyName,_that.basepathProxy,_that.basepathTarget,_that.targetName,_that.repoName,_that.repoTargetName,_that.gcp,_that.infoMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateProxyStatus status,  String outputPath,  String rawText,  String env,  String countryCode,  String proxyName,  String basepathProxy,  String basepathTarget,  String targetName,  String repoName,  String repoTargetName,  GCP gcp,  InfoMex? infoMex)?  $default,) {final _that = this;
switch (_that) {
case _CreateProxyState() when $default != null:
return $default(_that.status,_that.outputPath,_that.rawText,_that.env,_that.countryCode,_that.proxyName,_that.basepathProxy,_that.basepathTarget,_that.targetName,_that.repoName,_that.repoTargetName,_that.gcp,_that.infoMex);case _:
  return null;

}
}

}

/// @nodoc


class _CreateProxyState implements CreateProxyState {
  const _CreateProxyState({this.status = CreateProxyStatus.initial, this.outputPath = '', this.rawText = '', this.env = '', this.countryCode = '', this.proxyName = '', this.basepathProxy = '', this.basepathTarget = '', this.targetName = '', this.repoName = '', this.repoTargetName = '', this.gcp = GCP.milan, this.infoMex});
  

@override@JsonKey() final  CreateProxyStatus status;
@override@JsonKey() final  String outputPath;
@override@JsonKey() final  String rawText;
@override@JsonKey() final  String env;
@override@JsonKey() final  String countryCode;
@override@JsonKey() final  String proxyName;
@override@JsonKey() final  String basepathProxy;
@override@JsonKey() final  String basepathTarget;
@override@JsonKey() final  String targetName;
@override@JsonKey() final  String repoName;
@override@JsonKey() final  String repoTargetName;
@override@JsonKey() final  GCP gcp;
@override final  InfoMex? infoMex;

/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProxyStateCopyWith<_CreateProxyState> get copyWith => __$CreateProxyStateCopyWithImpl<_CreateProxyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProxyState&&(identical(other.status, status) || other.status == status)&&(identical(other.outputPath, outputPath) || other.outputPath == outputPath)&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.env, env) || other.env == env)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName)&&(identical(other.basepathProxy, basepathProxy) || other.basepathProxy == basepathProxy)&&(identical(other.basepathTarget, basepathTarget) || other.basepathTarget == basepathTarget)&&(identical(other.targetName, targetName) || other.targetName == targetName)&&(identical(other.repoName, repoName) || other.repoName == repoName)&&(identical(other.repoTargetName, repoTargetName) || other.repoTargetName == repoTargetName)&&(identical(other.gcp, gcp) || other.gcp == gcp)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,outputPath,rawText,env,countryCode,proxyName,basepathProxy,basepathTarget,targetName,repoName,repoTargetName,gcp,infoMex);

@override
String toString() {
  return 'CreateProxyState(status: $status, outputPath: $outputPath, rawText: $rawText, env: $env, countryCode: $countryCode, proxyName: $proxyName, basepathProxy: $basepathProxy, basepathTarget: $basepathTarget, targetName: $targetName, repoName: $repoName, repoTargetName: $repoTargetName, gcp: $gcp, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class _$CreateProxyStateCopyWith<$Res> implements $CreateProxyStateCopyWith<$Res> {
  factory _$CreateProxyStateCopyWith(_CreateProxyState value, $Res Function(_CreateProxyState) _then) = __$CreateProxyStateCopyWithImpl;
@override @useResult
$Res call({
 CreateProxyStatus status, String outputPath, String rawText, String env, String countryCode, String proxyName, String basepathProxy, String basepathTarget, String targetName, String repoName, String repoTargetName, GCP gcp, InfoMex? infoMex
});


@override $InfoMexCopyWith<$Res>? get infoMex;

}
/// @nodoc
class __$CreateProxyStateCopyWithImpl<$Res>
    implements _$CreateProxyStateCopyWith<$Res> {
  __$CreateProxyStateCopyWithImpl(this._self, this._then);

  final _CreateProxyState _self;
  final $Res Function(_CreateProxyState) _then;

/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? outputPath = null,Object? rawText = null,Object? env = null,Object? countryCode = null,Object? proxyName = null,Object? basepathProxy = null,Object? basepathTarget = null,Object? targetName = null,Object? repoName = null,Object? repoTargetName = null,Object? gcp = null,Object? infoMex = freezed,}) {
  return _then(_CreateProxyState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateProxyStatus,outputPath: null == outputPath ? _self.outputPath : outputPath // ignore: cast_nullable_to_non_nullable
as String,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,env: null == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,basepathProxy: null == basepathProxy ? _self.basepathProxy : basepathProxy // ignore: cast_nullable_to_non_nullable
as String,basepathTarget: null == basepathTarget ? _self.basepathTarget : basepathTarget // ignore: cast_nullable_to_non_nullable
as String,targetName: null == targetName ? _self.targetName : targetName // ignore: cast_nullable_to_non_nullable
as String,repoName: null == repoName ? _self.repoName : repoName // ignore: cast_nullable_to_non_nullable
as String,repoTargetName: null == repoTargetName ? _self.repoTargetName : repoTargetName // ignore: cast_nullable_to_non_nullable
as String,gcp: null == gcp ? _self.gcp : gcp // ignore: cast_nullable_to_non_nullable
as GCP,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
as InfoMex?,
  ));
}

/// Create a copy of CreateProxyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoMexCopyWith<$Res>? get infoMex {
    if (_self.infoMex == null) {
    return null;
  }

  return $InfoMexCopyWith<$Res>(_self.infoMex!, (value) {
    return _then(_self.copyWith(infoMex: value));
  });
}
}

// dart format on
