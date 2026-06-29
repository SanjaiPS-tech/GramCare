// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicineModel {

 String get id; String get userId; String get name; String get dosage; String get frequency; String get timing; DateTime get startDate; DateTime? get endDate; String? get instructions; bool get isActive; DateTime? get createdAt; DateTime? get updatedAt; String get syncStatus;
/// Create a copy of MedicineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineModelCopyWith<MedicineModel> get copyWith => _$MedicineModelCopyWithImpl<MedicineModel>(this as MedicineModel, _$identity);

  /// Serializes this MedicineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.timing, timing) || other.timing == timing)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,dosage,frequency,timing,startDate,endDate,instructions,isActive,createdAt,updatedAt,syncStatus);

@override
String toString() {
  return 'MedicineModel(id: $id, userId: $userId, name: $name, dosage: $dosage, frequency: $frequency, timing: $timing, startDate: $startDate, endDate: $endDate, instructions: $instructions, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $MedicineModelCopyWith<$Res>  {
  factory $MedicineModelCopyWith(MedicineModel value, $Res Function(MedicineModel) _then) = _$MedicineModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, String dosage, String frequency, String timing, DateTime startDate, DateTime? endDate, String? instructions, bool isActive, DateTime? createdAt, DateTime? updatedAt, String syncStatus
});




}
/// @nodoc
class _$MedicineModelCopyWithImpl<$Res>
    implements $MedicineModelCopyWith<$Res> {
  _$MedicineModelCopyWithImpl(this._self, this._then);

  final MedicineModel _self;
  final $Res Function(MedicineModel) _then;

/// Create a copy of MedicineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? dosage = null,Object? frequency = null,Object? timing = null,Object? startDate = null,Object? endDate = freezed,Object? instructions = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,timing: null == timing ? _self.timing : timing // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicineModel].
extension MedicineModelPatterns on MedicineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineModel value)  $default,){
final _that = this;
switch (_that) {
case _MedicineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineModel value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String dosage,  String frequency,  String timing,  DateTime startDate,  DateTime? endDate,  String? instructions,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.dosage,_that.frequency,_that.timing,_that.startDate,_that.endDate,_that.instructions,_that.isActive,_that.createdAt,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String dosage,  String frequency,  String timing,  DateTime startDate,  DateTime? endDate,  String? instructions,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _MedicineModel():
return $default(_that.id,_that.userId,_that.name,_that.dosage,_that.frequency,_that.timing,_that.startDate,_that.endDate,_that.instructions,_that.isActive,_that.createdAt,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name,  String dosage,  String frequency,  String timing,  DateTime startDate,  DateTime? endDate,  String? instructions,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _MedicineModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.dosage,_that.frequency,_that.timing,_that.startDate,_that.endDate,_that.instructions,_that.isActive,_that.createdAt,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicineModel implements MedicineModel {
  const _MedicineModel({required this.id, required this.userId, required this.name, required this.dosage, required this.frequency, required this.timing, required this.startDate, this.endDate, this.instructions, this.isActive = true, this.createdAt, this.updatedAt, this.syncStatus = 'PENDING'});
  factory _MedicineModel.fromJson(Map<String, dynamic> json) => _$MedicineModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override final  String dosage;
@override final  String frequency;
@override final  String timing;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  String? instructions;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of MedicineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineModelCopyWith<_MedicineModel> get copyWith => __$MedicineModelCopyWithImpl<_MedicineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.timing, timing) || other.timing == timing)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,dosage,frequency,timing,startDate,endDate,instructions,isActive,createdAt,updatedAt,syncStatus);

@override
String toString() {
  return 'MedicineModel(id: $id, userId: $userId, name: $name, dosage: $dosage, frequency: $frequency, timing: $timing, startDate: $startDate, endDate: $endDate, instructions: $instructions, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$MedicineModelCopyWith<$Res> implements $MedicineModelCopyWith<$Res> {
  factory _$MedicineModelCopyWith(_MedicineModel value, $Res Function(_MedicineModel) _then) = __$MedicineModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, String dosage, String frequency, String timing, DateTime startDate, DateTime? endDate, String? instructions, bool isActive, DateTime? createdAt, DateTime? updatedAt, String syncStatus
});




}
/// @nodoc
class __$MedicineModelCopyWithImpl<$Res>
    implements _$MedicineModelCopyWith<$Res> {
  __$MedicineModelCopyWithImpl(this._self, this._then);

  final _MedicineModel _self;
  final $Res Function(_MedicineModel) _then;

/// Create a copy of MedicineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? dosage = null,Object? frequency = null,Object? timing = null,Object? startDate = null,Object? endDate = freezed,Object? instructions = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? syncStatus = null,}) {
  return _then(_MedicineModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,timing: null == timing ? _self.timing : timing // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MedicineLogModel {

 String get id; String get medicineId; String get userId; DateTime get logDate; String get scheduledTime; String get status; DateTime? get takenAt; String? get notes; String get syncStatus;
/// Create a copy of MedicineLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineLogModelCopyWith<MedicineLogModel> get copyWith => _$MedicineLogModelCopyWithImpl<MedicineLogModel>(this as MedicineLogModel, _$identity);

  /// Serializes this MedicineLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,userId,logDate,scheduledTime,status,takenAt,notes,syncStatus);

@override
String toString() {
  return 'MedicineLogModel(id: $id, medicineId: $medicineId, userId: $userId, logDate: $logDate, scheduledTime: $scheduledTime, status: $status, takenAt: $takenAt, notes: $notes, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $MedicineLogModelCopyWith<$Res>  {
  factory $MedicineLogModelCopyWith(MedicineLogModel value, $Res Function(MedicineLogModel) _then) = _$MedicineLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String medicineId, String userId, DateTime logDate, String scheduledTime, String status, DateTime? takenAt, String? notes, String syncStatus
});




}
/// @nodoc
class _$MedicineLogModelCopyWithImpl<$Res>
    implements $MedicineLogModelCopyWith<$Res> {
  _$MedicineLogModelCopyWithImpl(this._self, this._then);

  final MedicineLogModel _self;
  final $Res Function(MedicineLogModel) _then;

/// Create a copy of MedicineLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? medicineId = null,Object? userId = null,Object? logDate = null,Object? scheduledTime = null,Object? status = null,Object? takenAt = freezed,Object? notes = freezed,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,takenAt: freezed == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicineLogModel].
extension MedicineLogModelPatterns on MedicineLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineLogModel value)  $default,){
final _that = this;
switch (_that) {
case _MedicineLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String medicineId,  String userId,  DateTime logDate,  String scheduledTime,  String status,  DateTime? takenAt,  String? notes,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineLogModel() when $default != null:
return $default(_that.id,_that.medicineId,_that.userId,_that.logDate,_that.scheduledTime,_that.status,_that.takenAt,_that.notes,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String medicineId,  String userId,  DateTime logDate,  String scheduledTime,  String status,  DateTime? takenAt,  String? notes,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _MedicineLogModel():
return $default(_that.id,_that.medicineId,_that.userId,_that.logDate,_that.scheduledTime,_that.status,_that.takenAt,_that.notes,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String medicineId,  String userId,  DateTime logDate,  String scheduledTime,  String status,  DateTime? takenAt,  String? notes,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _MedicineLogModel() when $default != null:
return $default(_that.id,_that.medicineId,_that.userId,_that.logDate,_that.scheduledTime,_that.status,_that.takenAt,_that.notes,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicineLogModel implements MedicineLogModel {
  const _MedicineLogModel({required this.id, required this.medicineId, required this.userId, required this.logDate, required this.scheduledTime, required this.status, this.takenAt, this.notes, this.syncStatus = 'PENDING'});
  factory _MedicineLogModel.fromJson(Map<String, dynamic> json) => _$MedicineLogModelFromJson(json);

@override final  String id;
@override final  String medicineId;
@override final  String userId;
@override final  DateTime logDate;
@override final  String scheduledTime;
@override final  String status;
@override final  DateTime? takenAt;
@override final  String? notes;
@override@JsonKey() final  String syncStatus;

/// Create a copy of MedicineLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineLogModelCopyWith<_MedicineLogModel> get copyWith => __$MedicineLogModelCopyWithImpl<_MedicineLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,userId,logDate,scheduledTime,status,takenAt,notes,syncStatus);

@override
String toString() {
  return 'MedicineLogModel(id: $id, medicineId: $medicineId, userId: $userId, logDate: $logDate, scheduledTime: $scheduledTime, status: $status, takenAt: $takenAt, notes: $notes, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$MedicineLogModelCopyWith<$Res> implements $MedicineLogModelCopyWith<$Res> {
  factory _$MedicineLogModelCopyWith(_MedicineLogModel value, $Res Function(_MedicineLogModel) _then) = __$MedicineLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String medicineId, String userId, DateTime logDate, String scheduledTime, String status, DateTime? takenAt, String? notes, String syncStatus
});




}
/// @nodoc
class __$MedicineLogModelCopyWithImpl<$Res>
    implements _$MedicineLogModelCopyWith<$Res> {
  __$MedicineLogModelCopyWithImpl(this._self, this._then);

  final _MedicineLogModel _self;
  final $Res Function(_MedicineLogModel) _then;

/// Create a copy of MedicineLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? medicineId = null,Object? userId = null,Object? logDate = null,Object? scheduledTime = null,Object? status = null,Object? takenAt = freezed,Object? notes = freezed,Object? syncStatus = null,}) {
  return _then(_MedicineLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,takenAt: freezed == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
