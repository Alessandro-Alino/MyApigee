// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser_xml_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParserXmlState {

 ParserXmlStatus get status; File? get file; String? get fileName; XmlDocument? get xmlDocument; List<ApiModel>? get apiModels; List<ApiModel>? get apiModelsFiltered; String? get xml; String? get errorMex;
/// Create a copy of ParserXmlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParserXmlStateCopyWith<ParserXmlState> get copyWith => _$ParserXmlStateCopyWithImpl<ParserXmlState>(this as ParserXmlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParserXmlState&&(identical(other.status, status) || other.status == status)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.xmlDocument, xmlDocument) || other.xmlDocument == xmlDocument)&&const DeepCollectionEquality().equals(other.apiModels, apiModels)&&const DeepCollectionEquality().equals(other.apiModelsFiltered, apiModelsFiltered)&&(identical(other.xml, xml) || other.xml == xml)&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,file,fileName,xmlDocument,const DeepCollectionEquality().hash(apiModels),const DeepCollectionEquality().hash(apiModelsFiltered),xml,errorMex);

@override
String toString() {
  return 'ParserXmlState(status: $status, file: $file, fileName: $fileName, xmlDocument: $xmlDocument, apiModels: $apiModels, apiModelsFiltered: $apiModelsFiltered, xml: $xml, errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class $ParserXmlStateCopyWith<$Res>  {
  factory $ParserXmlStateCopyWith(ParserXmlState value, $Res Function(ParserXmlState) _then) = _$ParserXmlStateCopyWithImpl;
@useResult
$Res call({
 ParserXmlStatus status, File? file, String? fileName, XmlDocument? xmlDocument, List<ApiModel>? apiModels, List<ApiModel>? apiModelsFiltered, String? xml, String? errorMex
});




}
/// @nodoc
class _$ParserXmlStateCopyWithImpl<$Res>
    implements $ParserXmlStateCopyWith<$Res> {
  _$ParserXmlStateCopyWithImpl(this._self, this._then);

  final ParserXmlState _self;
  final $Res Function(ParserXmlState) _then;

/// Create a copy of ParserXmlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? file = freezed,Object? fileName = freezed,Object? xmlDocument = freezed,Object? apiModels = freezed,Object? apiModelsFiltered = freezed,Object? xml = freezed,Object? errorMex = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParserXmlStatus,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,xmlDocument: freezed == xmlDocument ? _self.xmlDocument : xmlDocument // ignore: cast_nullable_to_non_nullable
as XmlDocument?,apiModels: freezed == apiModels ? _self.apiModels : apiModels // ignore: cast_nullable_to_non_nullable
as List<ApiModel>?,apiModelsFiltered: freezed == apiModelsFiltered ? _self.apiModelsFiltered : apiModelsFiltered // ignore: cast_nullable_to_non_nullable
as List<ApiModel>?,xml: freezed == xml ? _self.xml : xml // ignore: cast_nullable_to_non_nullable
as String?,errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParserXmlState].
extension ParserXmlStatePatterns on ParserXmlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParserXmlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParserXmlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParserXmlState value)  $default,){
final _that = this;
switch (_that) {
case _ParserXmlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParserXmlState value)?  $default,){
final _that = this;
switch (_that) {
case _ParserXmlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ParserXmlStatus status,  File? file,  String? fileName,  XmlDocument? xmlDocument,  List<ApiModel>? apiModels,  List<ApiModel>? apiModelsFiltered,  String? xml,  String? errorMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParserXmlState() when $default != null:
return $default(_that.status,_that.file,_that.fileName,_that.xmlDocument,_that.apiModels,_that.apiModelsFiltered,_that.xml,_that.errorMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ParserXmlStatus status,  File? file,  String? fileName,  XmlDocument? xmlDocument,  List<ApiModel>? apiModels,  List<ApiModel>? apiModelsFiltered,  String? xml,  String? errorMex)  $default,) {final _that = this;
switch (_that) {
case _ParserXmlState():
return $default(_that.status,_that.file,_that.fileName,_that.xmlDocument,_that.apiModels,_that.apiModelsFiltered,_that.xml,_that.errorMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ParserXmlStatus status,  File? file,  String? fileName,  XmlDocument? xmlDocument,  List<ApiModel>? apiModels,  List<ApiModel>? apiModelsFiltered,  String? xml,  String? errorMex)?  $default,) {final _that = this;
switch (_that) {
case _ParserXmlState() when $default != null:
return $default(_that.status,_that.file,_that.fileName,_that.xmlDocument,_that.apiModels,_that.apiModelsFiltered,_that.xml,_that.errorMex);case _:
  return null;

}
}

}

/// @nodoc


class _ParserXmlState implements ParserXmlState {
  const _ParserXmlState({required this.status, this.file, this.fileName, this.xmlDocument, final  List<ApiModel>? apiModels, final  List<ApiModel>? apiModelsFiltered, this.xml, this.errorMex}): _apiModels = apiModels,_apiModelsFiltered = apiModelsFiltered;
  

@override final  ParserXmlStatus status;
@override final  File? file;
@override final  String? fileName;
@override final  XmlDocument? xmlDocument;
 final  List<ApiModel>? _apiModels;
@override List<ApiModel>? get apiModels {
  final value = _apiModels;
  if (value == null) return null;
  if (_apiModels is EqualUnmodifiableListView) return _apiModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ApiModel>? _apiModelsFiltered;
@override List<ApiModel>? get apiModelsFiltered {
  final value = _apiModelsFiltered;
  if (value == null) return null;
  if (_apiModelsFiltered is EqualUnmodifiableListView) return _apiModelsFiltered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? xml;
@override final  String? errorMex;

/// Create a copy of ParserXmlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParserXmlStateCopyWith<_ParserXmlState> get copyWith => __$ParserXmlStateCopyWithImpl<_ParserXmlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParserXmlState&&(identical(other.status, status) || other.status == status)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.xmlDocument, xmlDocument) || other.xmlDocument == xmlDocument)&&const DeepCollectionEquality().equals(other._apiModels, _apiModels)&&const DeepCollectionEquality().equals(other._apiModelsFiltered, _apiModelsFiltered)&&(identical(other.xml, xml) || other.xml == xml)&&(identical(other.errorMex, errorMex) || other.errorMex == errorMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,file,fileName,xmlDocument,const DeepCollectionEquality().hash(_apiModels),const DeepCollectionEquality().hash(_apiModelsFiltered),xml,errorMex);

@override
String toString() {
  return 'ParserXmlState(status: $status, file: $file, fileName: $fileName, xmlDocument: $xmlDocument, apiModels: $apiModels, apiModelsFiltered: $apiModelsFiltered, xml: $xml, errorMex: $errorMex)';
}


}

/// @nodoc
abstract mixin class _$ParserXmlStateCopyWith<$Res> implements $ParserXmlStateCopyWith<$Res> {
  factory _$ParserXmlStateCopyWith(_ParserXmlState value, $Res Function(_ParserXmlState) _then) = __$ParserXmlStateCopyWithImpl;
@override @useResult
$Res call({
 ParserXmlStatus status, File? file, String? fileName, XmlDocument? xmlDocument, List<ApiModel>? apiModels, List<ApiModel>? apiModelsFiltered, String? xml, String? errorMex
});




}
/// @nodoc
class __$ParserXmlStateCopyWithImpl<$Res>
    implements _$ParserXmlStateCopyWith<$Res> {
  __$ParserXmlStateCopyWithImpl(this._self, this._then);

  final _ParserXmlState _self;
  final $Res Function(_ParserXmlState) _then;

/// Create a copy of ParserXmlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? file = freezed,Object? fileName = freezed,Object? xmlDocument = freezed,Object? apiModels = freezed,Object? apiModelsFiltered = freezed,Object? xml = freezed,Object? errorMex = freezed,}) {
  return _then(_ParserXmlState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParserXmlStatus,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,xmlDocument: freezed == xmlDocument ? _self.xmlDocument : xmlDocument // ignore: cast_nullable_to_non_nullable
as XmlDocument?,apiModels: freezed == apiModels ? _self._apiModels : apiModels // ignore: cast_nullable_to_non_nullable
as List<ApiModel>?,apiModelsFiltered: freezed == apiModelsFiltered ? _self._apiModelsFiltered : apiModelsFiltered // ignore: cast_nullable_to_non_nullable
as List<ApiModel>?,xml: freezed == xml ? _self.xml : xml // ignore: cast_nullable_to_non_nullable
as String?,errorMex: freezed == errorMex ? _self.errorMex : errorMex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
