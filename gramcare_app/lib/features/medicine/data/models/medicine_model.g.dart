// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) =>
    _MedicineModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      timing: json['timing'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      instructions: json['instructions'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'PENDING',
    );

Map<String, dynamic> _$MedicineModelToJson(_MedicineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'timing': instance.timing,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'instructions': instance.instructions,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };

_MedicineLogModel _$MedicineLogModelFromJson(Map<String, dynamic> json) =>
    _MedicineLogModel(
      id: json['id'] as String,
      medicineId: json['medicineId'] as String,
      userId: json['userId'] as String,
      logDate: DateTime.parse(json['logDate'] as String),
      scheduledTime: json['scheduledTime'] as String,
      status: json['status'] as String,
      takenAt: json['takenAt'] == null
          ? null
          : DateTime.parse(json['takenAt'] as String),
      notes: json['notes'] as String?,
      syncStatus: json['syncStatus'] as String? ?? 'PENDING',
    );

Map<String, dynamic> _$MedicineLogModelToJson(_MedicineLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineId': instance.medicineId,
      'userId': instance.userId,
      'logDate': instance.logDate.toIso8601String(),
      'scheduledTime': instance.scheduledTime,
      'status': instance.status,
      'takenAt': instance.takenAt?.toIso8601String(),
      'notes': instance.notes,
      'syncStatus': instance.syncStatus,
    };
