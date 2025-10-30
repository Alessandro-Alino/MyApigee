// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_mex_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InfoMex {

 String get mex; MexType get type;
/// Create a copy of InfoMex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoMexCopyWith<InfoMex> get copyWith => _$InfoMexCopyWithImpl<InfoMex>(this as InfoMex, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoMex&&(identical(other.mex, mex) || other.mex == mex)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,mex,type);

@override
String toString() {
  return 'InfoMex(mex: $mex, type: $type)';
}


}

/// @nodoc
abstract mixin class $InfoMexCopyWith<$Res>  {
  factory $InfoMexCopyWith(InfoMex value, $Res Function(InfoMex) _then) = _$InfoMexCopyWithImpl;
@useResult
$Res call({
 String mex, MexType type
});




}
/// @nodoc
class _$InfoMexCopyWithImpl<$Res>
    implements $InfoMexCopyWith<$Res> {
  _$InfoMexCopyWithImpl(this._self, this._then);

  final InfoMex _self;
  final $Res Function(InfoMex) _then;

/// Create a copy of InfoMex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mex = null,Object? type = null,}) {
  return _then(_self.copyWith(
mex: null == mex ? _self.mex : mex // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MexType,
  ));
}

}


/// Adds pattern-matching-related methods to [InfoMex].
extension InfoMexPatterns on InfoMex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoMex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoMex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoMex value)  $default,){
final _that = this;
switch (_that) {
case _InfoMex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoMex value)?  $default,){
final _that = this;
switch (_that) {
case _InfoMex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mex,  MexType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoMex() when $default != null:
return $default(_that.mex,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mex,  MexType type)  $default,) {final _that = this;
switch (_that) {
case _InfoMex():
return $default(_that.mex,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mex,  MexType type)?  $default,) {final _that = this;
switch (_that) {
case _InfoMex() when $default != null:
return $default(_that.mex,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _InfoMex implements InfoMex {
  const _InfoMex({required this.mex, required this.type});
  

@override final  String mex;
@override final  MexType type;

/// Create a copy of InfoMex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoMexCopyWith<_InfoMex> get copyWith => __$InfoMexCopyWithImpl<_InfoMex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoMex&&(identical(other.mex, mex) || other.mex == mex)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,mex,type);

@override
String toString() {
  return 'InfoMex(mex: $mex, type: $type)';
}


}

/// @nodoc
abstract mixin class _$InfoMexCopyWith<$Res> implements $InfoMexCopyWith<$Res> {
  factory _$InfoMexCopyWith(_InfoMex value, $Res Function(_InfoMex) _then) = __$InfoMexCopyWithImpl;
@override @useResult
$Res call({
 String mex, MexType type
});




}
/// @nodoc
class __$InfoMexCopyWithImpl<$Res>
    implements _$InfoMexCopyWith<$Res> {
  __$InfoMexCopyWithImpl(this._self, this._then);

  final _InfoMex _self;
  final $Res Function(_InfoMex) _then;

/// Create a copy of InfoMex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mex = null,Object? type = null,}) {
  return _then(_InfoMex(
mex: null == mex ? _self.mex : mex // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MexType,
  ));
}


}

// dart format on
