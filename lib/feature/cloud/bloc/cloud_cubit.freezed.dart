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

 CloudStatus get status; List<CloudItem> get files; List<String> get breadcrumb; bool get isNetworking; double get networkingProgress; String? get networkingFileId; List<FileUploadModel> get fileUploads; InfoMex? get infoMex;
/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudStateCopyWith<CloudState> get copyWith => _$CloudStateCopyWithImpl<CloudState>(this as CloudState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.files, files)&&const DeepCollectionEquality().equals(other.breadcrumb, breadcrumb)&&(identical(other.isNetworking, isNetworking) || other.isNetworking == isNetworking)&&(identical(other.networkingProgress, networkingProgress) || other.networkingProgress == networkingProgress)&&(identical(other.networkingFileId, networkingFileId) || other.networkingFileId == networkingFileId)&&const DeepCollectionEquality().equals(other.fileUploads, fileUploads)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(files),const DeepCollectionEquality().hash(breadcrumb),isNetworking,networkingProgress,networkingFileId,const DeepCollectionEquality().hash(fileUploads),infoMex);

@override
String toString() {
  return 'CloudState(status: $status, files: $files, breadcrumb: $breadcrumb, isNetworking: $isNetworking, networkingProgress: $networkingProgress, networkingFileId: $networkingFileId, fileUploads: $fileUploads, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class $CloudStateCopyWith<$Res>  {
  factory $CloudStateCopyWith(CloudState value, $Res Function(CloudState) _then) = _$CloudStateCopyWithImpl;
@useResult
$Res call({
 CloudStatus status, List<CloudItem> files, List<String> breadcrumb, bool isNetworking, double networkingProgress, String? networkingFileId, List<FileUploadModel> fileUploads, InfoMex? infoMex
});


$InfoMexCopyWith<$Res>? get infoMex;

}
/// @nodoc
class _$CloudStateCopyWithImpl<$Res>
    implements $CloudStateCopyWith<$Res> {
  _$CloudStateCopyWithImpl(this._self, this._then);

  final CloudState _self;
  final $Res Function(CloudState) _then;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? files = null,Object? breadcrumb = null,Object? isNetworking = null,Object? networkingProgress = null,Object? networkingFileId = freezed,Object? fileUploads = null,Object? infoMex = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CloudStatus,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<CloudItem>,breadcrumb: null == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<String>,isNetworking: null == isNetworking ? _self.isNetworking : isNetworking // ignore: cast_nullable_to_non_nullable
as bool,networkingProgress: null == networkingProgress ? _self.networkingProgress : networkingProgress // ignore: cast_nullable_to_non_nullable
as double,networkingFileId: freezed == networkingFileId ? _self.networkingFileId : networkingFileId // ignore: cast_nullable_to_non_nullable
as String?,fileUploads: null == fileUploads ? _self.fileUploads : fileUploads // ignore: cast_nullable_to_non_nullable
as List<FileUploadModel>,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
as InfoMex?,
  ));
}
/// Create a copy of CloudState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CloudStatus status,  List<CloudItem> files,  List<String> breadcrumb,  bool isNetworking,  double networkingProgress,  String? networkingFileId,  List<FileUploadModel> fileUploads,  InfoMex? infoMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.status,_that.files,_that.breadcrumb,_that.isNetworking,_that.networkingProgress,_that.networkingFileId,_that.fileUploads,_that.infoMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CloudStatus status,  List<CloudItem> files,  List<String> breadcrumb,  bool isNetworking,  double networkingProgress,  String? networkingFileId,  List<FileUploadModel> fileUploads,  InfoMex? infoMex)  $default,) {final _that = this;
switch (_that) {
case _CloudState():
return $default(_that.status,_that.files,_that.breadcrumb,_that.isNetworking,_that.networkingProgress,_that.networkingFileId,_that.fileUploads,_that.infoMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CloudStatus status,  List<CloudItem> files,  List<String> breadcrumb,  bool isNetworking,  double networkingProgress,  String? networkingFileId,  List<FileUploadModel> fileUploads,  InfoMex? infoMex)?  $default,) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.status,_that.files,_that.breadcrumb,_that.isNetworking,_that.networkingProgress,_that.networkingFileId,_that.fileUploads,_that.infoMex);case _:
  return null;

}
}

}

/// @nodoc


class _CloudState implements CloudState {
  const _CloudState({this.status = CloudStatus.initial, final  List<CloudItem> files = const [], final  List<String> breadcrumb = const [], this.isNetworking = false, this.networkingProgress = 0.0, this.networkingFileId, final  List<FileUploadModel> fileUploads = const [], this.infoMex}): _files = files,_breadcrumb = breadcrumb,_fileUploads = fileUploads;
  

@override@JsonKey() final  CloudStatus status;
 final  List<CloudItem> _files;
@override@JsonKey() List<CloudItem> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

 final  List<String> _breadcrumb;
@override@JsonKey() List<String> get breadcrumb {
  if (_breadcrumb is EqualUnmodifiableListView) return _breadcrumb;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breadcrumb);
}

@override@JsonKey() final  bool isNetworking;
@override@JsonKey() final  double networkingProgress;
@override final  String? networkingFileId;
 final  List<FileUploadModel> _fileUploads;
@override@JsonKey() List<FileUploadModel> get fileUploads {
  if (_fileUploads is EqualUnmodifiableListView) return _fileUploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fileUploads);
}

@override final  InfoMex? infoMex;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudStateCopyWith<_CloudState> get copyWith => __$CloudStateCopyWithImpl<_CloudState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._files, _files)&&const DeepCollectionEquality().equals(other._breadcrumb, _breadcrumb)&&(identical(other.isNetworking, isNetworking) || other.isNetworking == isNetworking)&&(identical(other.networkingProgress, networkingProgress) || other.networkingProgress == networkingProgress)&&(identical(other.networkingFileId, networkingFileId) || other.networkingFileId == networkingFileId)&&const DeepCollectionEquality().equals(other._fileUploads, _fileUploads)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_files),const DeepCollectionEquality().hash(_breadcrumb),isNetworking,networkingProgress,networkingFileId,const DeepCollectionEquality().hash(_fileUploads),infoMex);

@override
String toString() {
  return 'CloudState(status: $status, files: $files, breadcrumb: $breadcrumb, isNetworking: $isNetworking, networkingProgress: $networkingProgress, networkingFileId: $networkingFileId, fileUploads: $fileUploads, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class _$CloudStateCopyWith<$Res> implements $CloudStateCopyWith<$Res> {
  factory _$CloudStateCopyWith(_CloudState value, $Res Function(_CloudState) _then) = __$CloudStateCopyWithImpl;
@override @useResult
$Res call({
 CloudStatus status, List<CloudItem> files, List<String> breadcrumb, bool isNetworking, double networkingProgress, String? networkingFileId, List<FileUploadModel> fileUploads, InfoMex? infoMex
});


@override $InfoMexCopyWith<$Res>? get infoMex;

}
/// @nodoc
class __$CloudStateCopyWithImpl<$Res>
    implements _$CloudStateCopyWith<$Res> {
  __$CloudStateCopyWithImpl(this._self, this._then);

  final _CloudState _self;
  final $Res Function(_CloudState) _then;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? files = null,Object? breadcrumb = null,Object? isNetworking = null,Object? networkingProgress = null,Object? networkingFileId = freezed,Object? fileUploads = null,Object? infoMex = freezed,}) {
  return _then(_CloudState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CloudStatus,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<CloudItem>,breadcrumb: null == breadcrumb ? _self._breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<String>,isNetworking: null == isNetworking ? _self.isNetworking : isNetworking // ignore: cast_nullable_to_non_nullable
as bool,networkingProgress: null == networkingProgress ? _self.networkingProgress : networkingProgress // ignore: cast_nullable_to_non_nullable
as double,networkingFileId: freezed == networkingFileId ? _self.networkingFileId : networkingFileId // ignore: cast_nullable_to_non_nullable
as String?,fileUploads: null == fileUploads ? _self._fileUploads : fileUploads // ignore: cast_nullable_to_non_nullable
as List<FileUploadModel>,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
as InfoMex?,
  ));
}

/// Create a copy of CloudState
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
