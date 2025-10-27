// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloudState {

 String? get errorMex;
/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudStateCopyWith<CloudState> get copyWith => _$CloudStateCopyWithImpl<CloudState>(this as CloudState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudState&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,errorMex);

@override
String toString() {
  return 'CloudState(errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class $CloudStateCopyWith<$Res>  {
  factory $CloudStateCopyWith(CloudState value, $Res Function(CloudState) _then) = _$CloudStateCopyWithImpl;
@useResult
$Res call({
 String? errorMex
});




}
/// @nodoc
class _$CloudStateCopyWithImpl<$Res>
    implements $CloudStateCopyWith<$Res> {
  _$CloudStateCopyWithImpl(this._self, this._then);

  final CloudState _self;
  final $Res Function(CloudState) _then;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMex = freezed,}) {
  return _then(_self.copyWith(
errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudState].
extension CloudStatePatterns on CloudState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudState value)  $default,){
final _that = this;
switch (_that) {
case _CloudState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudState value)?  $default,){
final _that = this;
switch (_that) {
case _CloudState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.errorMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMex)  $default,) {final _that = this;
switch (_that) {
case _CloudState():
return $default(_that.errorMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMex)?  $default,) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.errorMex);case _:
  return null;

}
}

}

/// @nodoc


class _CloudState implements CloudState {
  const _CloudState({this.errorMex});
  

@override final  String? errorMex;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudStateCopyWith<_CloudState> get copyWith => __$CloudStateCopyWithImpl<_CloudState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudState&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,errorMex);

@override
String toString() {
  return 'CloudState(errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class _$CloudStateCopyWith<$Res> implements $CloudStateCopyWith<$Res> {
  factory _$CloudStateCopyWith(_CloudState value, $Res Function(_CloudState) _then) = __$CloudStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMex
});




}
/// @nodoc
class __$CloudStateCopyWithImpl<$Res>
    implements _$CloudStateCopyWith<$Res> {
  __$CloudStateCopyWithImpl(this._self, this._then);

  final _CloudState _self;
  final $Res Function(_CloudState) _then;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMex = freezed,}) {
  return _then(_CloudState(
errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
