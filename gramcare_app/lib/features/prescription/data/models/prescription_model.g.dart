// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) =>
    _PrescriptionModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      imageUrl: json['imageUrl'] as String?,
      imagePath: json['imagePath'] as String?,
      ocrText: json['ocrText'] as String?,
      aiExplanation: json['aiExplanation'] as String?,
      language: json['language'] as String? ?? 'en',
      doctorId: json['doctorId'] as String?,
      prescribedDate: json['prescribedDate'] == null
          ? null
          : DateTime.parse(json['prescribedDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'PENDING',
    );

Map<String, dynamic> _$PrescriptionModelToJson(_PrescriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'imagePath': instance.imagePath,
      'ocrText': instance.ocrText,
      'aiExplanation': instance.aiExplanation,
      'language': instance.language,
      'doctorId': instance.doctorId,
      'prescribedDate': instance.prescribedDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
