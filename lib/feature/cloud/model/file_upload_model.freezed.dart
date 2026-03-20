// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileUploadModel {

 FileUploadStatus get fileUploadStatus; File get fileUpload; String get fileName;
/// Create a copy of FileUploadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadModelCopyWith<FileUploadModel> get copyWith => _$FileUploadModelCopyWithImpl<FileUploadModel>(this as FileUploadModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadModel&&(identical(other.fileUploadStatus, fileUploadStatus) || other.fileUploadStatus == fileUploadStatus)&&(identical(other.fileUpload, fileUpload) || other.fileUpload == fileUpload)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,fileUploadStatus,fileUpload,fileName);

@override
String toString() {
  return 'FileUploadModel(fileUploadStatus: $fileUploadStatus, fileUpload: $fileUpload, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $FileUploadModelCopyWith<$Res>  {
  factory $FileUploadModelCopyWith(FileUploadModel value, $Res Function(FileUploadModel) _then) = _$FileUploadModelCopyWithImpl;
@useResult
$Res call({
 FileUploadStatus fileUploadStatus, File fileUpload, String fileName
});




}
/// @nodoc
class _$FileUploadModelCopyWithImpl<$Res>
    implements $FileUploadModelCopyWith<$Res> {
  _$FileUploadModelCopyWithImpl(this._self, this._then);

  final FileUploadModel _self;
  final $Res Function(FileUploadModel) _then;

/// Create a copy of FileUploadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileUploadStatus = null,Object? fileUpload = null,Object? fileName = null,}) {
  return _then(_self.copyWith(
fileUploadStatus: null == fileUploadStatus ? _self.fileUploadStatus : fileUploadStatus // ignore: cast_nullable_to_non_nullable
as FileUploadStatus,fileUpload: null == fileUpload ? _self.fileUpload : fileUpload // ignore: cast_nullable_to_non_nullable
as File,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileUploadModel].
extension FileUploadModelPatterns on FileUploadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileUploadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileUploadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileUploadModel value)  $default,){
final _that = this;
switch (_that) {
case _FileUploadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileUploadModel value)?  $default,){
final _that = this;
switch (_that) {
case _FileUploadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FileUploadStatus fileUploadStatus,  File fileUpload,  String fileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileUploadModel() when $default != null:
return $default(_that.fileUploadStatus,_that.fileUpload,_that.fileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FileUploadStatus fileUploadStatus,  File fileUpload,  String fileName)  $default,) {final _that = this;
switch (_that) {
case _FileUploadModel():
return $default(_that.fileUploadStatus,_that.fileUpload,_that.fileName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FileUploadStatus fileUploadStatus,  File fileUpload,  String fileName)?  $default,) {final _that = this;
switch (_that) {
case _FileUploadModel() when $default != null:
return $default(_that.fileUploadStatus,_that.fileUpload,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc


class _FileUploadModel implements FileUploadModel {
  const _FileUploadModel({this.fileUploadStatus = FileUploadStatus.init, required this.fileUpload, this.fileName = ''});
  

@override@JsonKey() final  FileUploadStatus fileUploadStatus;
@override final  File fileUpload;
@override@JsonKey() final  String fileName;

/// Create a copy of FileUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileUploadModelCopyWith<_FileUploadModel> get copyWith => __$FileUploadModelCopyWithImpl<_FileUploadModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileUploadModel&&(identical(other.fileUploadStatus, fileUploadStatus) || other.fileUploadStatus == fileUploadStatus)&&(identical(other.fileUpload, fileUpload) || other.fileUpload == fileUpload)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,fileUploadStatus,fileUpload,fileName);

@override
String toString() {
  return 'FileUploadModel(fileUploadStatus: $fileUploadStatus, fileUpload: $fileUpload, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$FileUploadModelCopyWith<$Res> implements $FileUploadModelCopyWith<$Res> {
  factory _$FileUploadModelCopyWith(_FileUploadModel value, $Res Function(_FileUploadModel) _then) = __$FileUploadModelCopyWithImpl;
@override @useResult
$Res call({
 FileUploadStatus fileUploadStatus, File fileUpload, String fileName
});




}
/// @nodoc
class __$FileUploadModelCopyWithImpl<$Res>
    implements _$FileUploadModelCopyWith<$Res> {
  __$FileUploadModelCopyWithImpl(this._self, this._then);

  final _FileUploadModel _self;
  final $Res Function(_FileUploadModel) _then;

/// Create a copy of FileUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileUploadStatus = null,Object? fileUpload = null,Object? fileName = null,}) {
  return _then(_FileUploadModel(
fileUploadStatus: null == fileUploadStatus ? _self.fileUploadStatus : fileUploadStatus // ignore: cast_nullable_to_non_nullable
as FileUploadStatus,fileUpload: null == fileUpload ? _self.fileUpload : fileUpload // ignore: cast_nullable_to_non_nullable
as File,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
