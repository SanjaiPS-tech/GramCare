// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionModel {

 String get id; String get userId; String? get imageUrl; String? get imagePath; String? get ocrText; String? get aiExplanation; String get language; String? get doctorId; DateTime? get prescribedDate; DateTime? get createdAt; String get syncStatus;
/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionModelCopyWith<PrescriptionModel> get copyWith => _$PrescriptionModelCopyWithImpl<PrescriptionModel>(this as PrescriptionModel, _$identity);

  /// Serializes this PrescriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocrText, ocrText) || other.ocrText == ocrText)&&(identical(other.aiExplanation, aiExplanation) || other.aiExplanation == aiExplanation)&&(identical(other.language, language) || other.language == language)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.prescribedDate, prescribedDate) || other.prescribedDate == prescribedDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,imageUrl,imagePath,ocrText,aiExplanation,language,doctorId,prescribedDate,createdAt,syncStatus);

@override
String toString() {
  return 'PrescriptionModel(id: $id, userId: $userId, imageUrl: $imageUrl, imagePath: $imagePath, ocrText: $ocrText, aiExplanation: $aiExplanation, language: $language, doctorId: $doctorId, prescribedDate: $prescribedDate, createdAt: $createdAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $PrescriptionModelCopyWith<$Res>  {
  factory $PrescriptionModelCopyWith(PrescriptionModel value, $Res Function(PrescriptionModel) _then) = _$PrescriptionModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? imageUrl, String? imagePath, String? ocrText, String? aiExplanation, String language, String? doctorId, DateTime? prescribedDate, DateTime? createdAt, String syncStatus
});




}
/// @nodoc
class _$PrescriptionModelCopyWithImpl<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._self, this._then);

  final PrescriptionModel _self;
  final $Res Function(PrescriptionModel) _then;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? imageUrl = freezed,Object? imagePath = freezed,Object? ocrText = freezed,Object? aiExplanation = freezed,Object? language = null,Object? doctorId = freezed,Object? prescribedDate = freezed,Object? createdAt = freezed,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,ocrText: freezed == ocrText ? _self.ocrText : ocrText // ignore: cast_nullable_to_non_nullable
as String?,aiExplanation: freezed == aiExplanation ? _self.aiExplanation : aiExplanation // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,prescribedDate: freezed == prescribedDate ? _self.prescribedDate : prescribedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionModel].
extension PrescriptionModelPatterns on PrescriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? imageUrl,  String? imagePath,  String? ocrText,  String? aiExplanation,  String language,  String? doctorId,  DateTime? prescribedDate,  DateTime? createdAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.userId,_that.imageUrl,_that.imagePath,_that.ocrText,_that.aiExplanation,_that.language,_that.doctorId,_that.prescribedDate,_that.createdAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? imageUrl,  String? imagePath,  String? ocrText,  String? aiExplanation,  String language,  String? doctorId,  DateTime? prescribedDate,  DateTime? createdAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel():
return $default(_that.id,_that.userId,_that.imageUrl,_that.imagePath,_that.ocrText,_that.aiExplanation,_that.language,_that.doctorId,_that.prescribedDate,_that.createdAt,_that.syncStatus);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? imageUrl,  String? imagePath,  String? ocrText,  String? aiExplanation,  String language,  String? doctorId,  DateTime? prescribedDate,  DateTime? createdAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.userId,_that.imageUrl,_that.imagePath,_that.ocrText,_that.aiExplanation,_that.language,_that.doctorId,_that.prescribedDate,_that.createdAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionModel implements PrescriptionModel {
  const _PrescriptionModel({required this.id, required this.userId, this.imageUrl, this.imagePath, this.ocrText, this.aiExplanation, this.language = 'en', this.doctorId, this.prescribedDate, this.createdAt, this.syncStatus = 'PENDING'});
  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? imageUrl;
@override final  String? imagePath;
@override final  String? ocrText;
@override final  String? aiExplanation;
@override@JsonKey() final  String language;
@override final  String? doctorId;
@override final  DateTime? prescribedDate;
@override final  DateTime? createdAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionModelCopyWith<_PrescriptionModel> get copyWith => __$PrescriptionModelCopyWithImpl<_PrescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocrText, ocrText) || other.ocrText == ocrText)&&(identical(other.aiExplanation, aiExplanation) || other.aiExplanation == aiExplanation)&&(identical(other.language, language) || other.language == language)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.prescribedDate, prescribedDate) || other.prescribedDate == prescribedDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,imageUrl,imagePath,ocrText,aiExplanation,language,doctorId,prescribedDate,createdAt,syncStatus);

@override
String toString() {
  return 'PrescriptionModel(id: $id, userId: $userId, imageUrl: $imageUrl, imagePath: $imagePath, ocrText: $ocrText, aiExplanation: $aiExplanation, language: $language, doctorId: $doctorId, prescribedDate: $prescribedDate, createdAt: $createdAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionModelCopyWith<$Res> implements $PrescriptionModelCopyWith<$Res> {
  factory _$PrescriptionModelCopyWith(_PrescriptionModel value, $Res Function(_PrescriptionModel) _then) = __$PrescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? imageUrl, String? imagePath, String? ocrText, String? aiExplanation, String language, String? doctorId, DateTime? prescribedDate, DateTime? createdAt, String syncStatus
});




}
/// @nodoc
class __$PrescriptionModelCopyWithImpl<$Res>
    implements _$PrescriptionModelCopyWith<$Res> {
  __$PrescriptionModelCopyWithImpl(this._self, this._then);

  final _PrescriptionModel _self;
  final $Res Function(_PrescriptionModel) _then;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? imageUrl = freezed,Object? imagePath = freezed,Object? ocrText = freezed,Object? aiExplanation = freezed,Object? language = null,Object? doctorId = freezed,Object? prescribedDate = freezed,Object? createdAt = freezed,Object? syncStatus = null,}) {
  return _then(_PrescriptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,ocrText: freezed == ocrText ? _self.ocrText : ocrText // ignore: cast_nullable_to_non_nullable
as String?,aiExplanation: freezed == aiExplanation ? _self.aiExplanation : aiExplanation // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,prescribedDate: freezed == prescribedDate ? _self.prescribedDate : prescribedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
