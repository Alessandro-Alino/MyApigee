// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_api_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateApiState {

 String? get result; String? get errorMex;
/// Create a copy of CreateApiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateApiStateCopyWith<CreateApiState> get copyWith => _$CreateApiStateCopyWithImpl<CreateApiState>(this as CreateApiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApiState&&(identical(other.result, result) || other.result == result)&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,result,errorMex);

@override
String toString() {
  return 'CreateApiState(result: $result, errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class $CreateApiStateCopyWith<$Res>  {
  factory $CreateApiStateCopyWith(CreateApiState value, $Res Function(CreateApiState) _then) = _$CreateApiStateCopyWithImpl;
@useResult
$Res call({
 String? result, String? errorMex
});




}
/// @nodoc
class _$CreateApiStateCopyWithImpl<$Res>
    implements $CreateApiStateCopyWith<$Res> {
  _$CreateApiStateCopyWithImpl(this._self, this._then);

  final CreateApiState _self;
  final $Res Function(CreateApiState) _then;

/// Create a copy of CreateApiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? errorMex = freezed,}) {
  return _then(_self.copyWith(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateApiState].
extension CreateApiStatePatterns on CreateApiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateApiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateApiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateApiState value)  $default,){
final _that = this;
switch (_that) {
case _CreateApiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateApiState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateApiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? result,  String? errorMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateApiState() when $default != null:
return $default(_that.result,_that.errorMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? result,  String? errorMex)  $default,) {final _that = this;
switch (_that) {
case _CreateApiState():
return $default(_that.result,_that.errorMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? result,  String? errorMex)?  $default,) {final _that = this;
switch (_that) {
case _CreateApiState() when $default != null:
return $default(_that.result,_that.errorMex);case _:
  return null;

}
}

}

/// @nodoc


class _CreateApiState implements CreateApiState {
  const _CreateApiState({this.result, this.errorMex});
  

@override final  String? result;
@override final  String? errorMex;

/// Create a copy of CreateApiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateApiStateCopyWith<_CreateApiState> get copyWith => __$CreateApiStateCopyWithImpl<_CreateApiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateApiState&&(identical(other.result, result) || other.result == result)&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,result,errorMex);

@override
String toString() {
  return 'CreateApiState(result: $result, errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class _$CreateApiStateCopyWith<$Res> implements $CreateApiStateCopyWith<$Res> {
  factory _$CreateApiStateCopyWith(_CreateApiState value, $Res Function(_CreateApiState) _then) = __$CreateApiStateCopyWithImpl;
@override @useResult
$Res call({
 String? result, String? errorMex
});




}
/// @nodoc
class __$CreateApiStateCopyWithImpl<$Res>
    implements _$CreateApiStateCopyWith<$Res> {
  __$CreateApiStateCopyWithImpl(this._self, this._then);

  final _CreateApiState _self;
  final $Res Function(_CreateApiState) _then;

/// Create a copy of CreateApiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? errorMex = freezed,}) {
  return _then(_CreateApiState(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
