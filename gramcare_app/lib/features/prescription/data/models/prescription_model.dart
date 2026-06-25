import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_model.freezed.dart';
part 'prescription_model.g.dart';

@freezed
class PrescriptionModel with _$PrescriptionModel {
  const factory PrescriptionModel({
    required String id,
    required String userId,
    String? imageUrl,
    String? imagePath,
    String? ocrText,
    String? aiExplanation,
    @Default('en') String language,
    String? doctorId,
    DateTime? prescribedDate,
    DateTime? createdAt,
    @Default('PENDING') String syncStatus,
  }) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);
}
