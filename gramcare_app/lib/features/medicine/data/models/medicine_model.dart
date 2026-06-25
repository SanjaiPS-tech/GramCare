import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_model.freezed.dart';
part 'medicine_model.g.dart';

@freezed
class MedicineModel with _$MedicineModel {
  const factory MedicineModel({
    required String id,
    required String userId,
    required String name,
    required String dosage,
    required String frequency,
    required String timing,
    required DateTime startDate,
    DateTime? endDate,
    String? instructions,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default('PENDING') String syncStatus,
  }) = _MedicineModel;

  factory MedicineModel.fromJson(Map<String, dynamic> json) => _$MedicineModelFromJson(json);
}

@freezed
class MedicineLogModel with _$MedicineLogModel {
  const factory MedicineLogModel({
    required String id,
    required String medicineId,
    required String userId,
    required DateTime logDate,
    required String scheduledTime,
    required String status, // TAKEN, MISSED, SKIPPED
    DateTime? takenAt,
    String? notes,
    @Default('PENDING') String syncStatus,
  }) = _MedicineLogModel;

  factory MedicineLogModel.fromJson(Map<String, dynamic> json) => _$MedicineLogModelFromJson(json);
}
