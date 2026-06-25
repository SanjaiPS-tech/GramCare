import 'package:equatable/equatable.dart';

class PrescriptionEntity extends Equatable {
  final String id;
  final String userId;
  final String? imageUrl;
  final String? imagePath;
  final String? ocrText;
  final String? aiExplanation;
  final String language;
  final DateTime? prescribedDate;

  const PrescriptionEntity({
    required this.id,
    required this.userId,
    this.imageUrl,
    this.imagePath,
    this.ocrText,
    this.aiExplanation,
    required this.language,
    this.prescribedDate,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        imageUrl,
        imagePath,
        ocrText,
        aiExplanation,
        language,
        prescribedDate,
      ];
}
