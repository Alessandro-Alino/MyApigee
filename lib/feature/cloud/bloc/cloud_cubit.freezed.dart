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

 CloudStatus get status; List<FileObject> get files; bool get isNetworking; double get networkinProgress; String? get networkingFileId; File? get selectedFileUpload; String? get selectedFileUploadName; InfoMex? get infoMex;
/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudStateCopyWith<CloudState> get copyWith => _$CloudStateCopyWithImpl<CloudState>(this as CloudState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.isNetworking, isNetworking) || other.isNetworking == isNetworking)&&(identical(other.networkinProgress, networkinProgress) || other.networkinProgress == networkinProgress)&&(identical(other.networkingFileId, networkingFileId) || other.networkingFileId == networkingFileId)&&(identical(other.selectedFileUpload, selectedFileUpload) || other.selectedFileUpload == selectedFileUpload)&&(identical(other.selectedFileUploadName, selectedFileUploadName) || other.selectedFileUploadName == selectedFileUploadName)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(files),isNetworking,networkinProgress,networkingFileId,selectedFileUpload,selectedFileUploadName,infoMex);

@override
String toString() {
  return 'CloudState(status: $status, files: $files, isNetworking: $isNetworking, networkinProgress: $networkinProgress, networkingFileId: $networkingFileId, selectedFileUpload: $selectedFileUpload, selectedFileUploadName: $selectedFileUploadName, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class $CloudStateCopyWith<$Res>  {
  factory $CloudStateCopyWith(CloudState value, $Res Function(CloudState) _then) = _$CloudStateCopyWithImpl;
@useResult
$Res call({
 CloudStatus status, List<FileObject> files, bool isNetworking, double networkinProgress, String? networkingFileId, File? selectedFileUpload, String? selectedFileUploadName, InfoMex? infoMex
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? files = null,Object? isNetworking = null,Object? networkinProgress = null,Object? networkingFileId = freezed,Object? selectedFileUpload = freezed,Object? selectedFileUploadName = freezed,Object? infoMex = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CloudStatus,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileObject>,isNetworking: null == isNetworking ? _self.isNetworking : isNetworking // ignore: cast_nullable_to_non_nullable
as bool,networkinProgress: null == networkinProgress ? _self.networkinProgress : networkinProgress // ignore: cast_nullable_to_non_nullable
as double,networkingFileId: freezed == networkingFileId ? _self.networkingFileId : networkingFileId // ignore: cast_nullable_to_non_nullable
as String?,selectedFileUpload: freezed == selectedFileUpload ? _self.selectedFileUpload : selectedFileUpload // ignore: cast_nullable_to_non_nullable
as File?,selectedFileUploadName: freezed == selectedFileUploadName ? _self.selectedFileUploadName : selectedFileUploadName // ignore: cast_nullable_to_non_nullable
as String?,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CloudStatus status,  List<FileObject> files,  bool isNetworking,  double networkinProgress,  String? networkingFileId,  File? selectedFileUpload,  String? selectedFileUploadName,  InfoMex? infoMex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.status,_that.files,_that.isNetworking,_that.networkinProgress,_that.networkingFileId,_that.selectedFileUpload,_that.selectedFileUploadName,_that.infoMex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CloudStatus status,  List<FileObject> files,  bool isNetworking,  double networkinProgress,  String? networkingFileId,  File? selectedFileUpload,  String? selectedFileUploadName,  InfoMex? infoMex)  $default,) {final _that = this;
switch (_that) {
case _CloudState():
return $default(_that.status,_that.files,_that.isNetworking,_that.networkinProgress,_that.networkingFileId,_that.selectedFileUpload,_that.selectedFileUploadName,_that.infoMex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CloudStatus status,  List<FileObject> files,  bool isNetworking,  double networkinProgress,  String? networkingFileId,  File? selectedFileUpload,  String? selectedFileUploadName,  InfoMex? infoMex)?  $default,) {final _that = this;
switch (_that) {
case _CloudState() when $default != null:
return $default(_that.status,_that.files,_that.isNetworking,_that.networkinProgress,_that.networkingFileId,_that.selectedFileUpload,_that.selectedFileUploadName,_that.infoMex);case _:
  return null;

}
}

}

/// @nodoc


class _CloudState implements CloudState {
  const _CloudState({this.status = CloudStatus.initial, final  List<FileObject> files = const [], this.isNetworking = false, this.networkinProgress = 0.0, this.networkingFileId, this.selectedFileUpload, this.selectedFileUploadName, this.infoMex}): _files = files;
  

@override@JsonKey() final  CloudStatus status;
 final  List<FileObject> _files;
@override@JsonKey() List<FileObject> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override@JsonKey() final  bool isNetworking;
@override@JsonKey() final  double networkinProgress;
@override final  String? networkingFileId;
@override final  File? selectedFileUpload;
@override final  String? selectedFileUploadName;
@override final  InfoMex? infoMex;

/// Create a copy of CloudState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudStateCopyWith<_CloudState> get copyWith => __$CloudStateCopyWithImpl<_CloudState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.isNetworking, isNetworking) || other.isNetworking == isNetworking)&&(identical(other.networkinProgress, networkinProgress) || other.networkinProgress == networkinProgress)&&(identical(other.networkingFileId, networkingFileId) || other.networkingFileId == networkingFileId)&&(identical(other.selectedFileUpload, selectedFileUpload) || other.selectedFileUpload == selectedFileUpload)&&(identical(other.selectedFileUploadName, selectedFileUploadName) || other.selectedFileUploadName == selectedFileUploadName)&&(identical(other.infoMex, infoMex) || other.infoMex == infoMex));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_files),isNetworking,networkinProgress,networkingFileId,selectedFileUpload,selectedFileUploadName,infoMex);

@override
String toString() {
  return 'CloudState(status: $status, files: $files, isNetworking: $isNetworking, networkinProgress: $networkinProgress, networkingFileId: $networkingFileId, selectedFileUpload: $selectedFileUpload, selectedFileUploadName: $selectedFileUploadName, infoMex: $infoMex)';
}


}

/// @nodoc
abstract mixin class _$CloudStateCopyWith<$Res> implements $CloudStateCopyWith<$Res> {
  factory _$CloudStateCopyWith(_CloudState value, $Res Function(_CloudState) _then) = __$CloudStateCopyWithImpl;
@override @useResult
$Res call({
 CloudStatus status, List<FileObject> files, bool isNetworking, double networkinProgress, String? networkingFileId, File? selectedFileUpload, String? selectedFileUploadName, InfoMex? infoMex
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? files = null,Object? isNetworking = null,Object? networkinProgress = null,Object? networkingFileId = freezed,Object? selectedFileUpload = freezed,Object? selectedFileUploadName = freezed,Object? infoMex = freezed,}) {
  return _then(_CloudState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CloudStatus,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileObject>,isNetworking: null == isNetworking ? _self.isNetworking : isNetworking // ignore: cast_nullable_to_non_nullable
as bool,networkinProgress: null == networkinProgress ? _self.networkinProgress : networkinProgress // ignore: cast_nullable_to_non_nullable
as double,networkingFileId: freezed == networkingFileId ? _self.networkingFileId : networkingFileId // ignore: cast_nullable_to_non_nullable
as String?,selectedFileUpload: freezed == selectedFileUpload ? _self.selectedFileUpload : selectedFileUpload // ignore: cast_nullable_to_non_nullable
as File?,selectedFileUploadName: freezed == selectedFileUploadName ? _self.selectedFileUploadName : selectedFileUploadName // ignore: cast_nullable_to_non_nullable
as String?,infoMex: freezed == infoMex ? _self.infoMex : infoMex // ignore: cast_nullable_to_non_nullable
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
