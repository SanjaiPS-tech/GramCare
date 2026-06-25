import 'package:equatable/equatable.dart';

class MedicineEntity extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String dosage;
  final String frequency;
  final String timing;
  final DateTime startDate;
  final DateTime? endDate;
  final String? instructions;
  final bool isActive;

  const MedicineEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.timing,
    required this.startDate,
    this.endDate,
    this.instructions,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        dosage,
        frequency,
        timing,
        startDate,
        endDate,
        instructions,
        isActive,
      ];
}

class MedicineLogEntity extends Equatable {
  final String id;
  final String medicineId;
  final String userId;
  final DateTime logDate;
  final String scheduledTime;
  final String status;
  final DateTime? takenAt;
  final String? notes;

  const MedicineLogEntity({
    required this.id,
    required this.medicineId,
    required this.userId,
    required this.logDate,
    required this.scheduledTime,
    required this.status,
    this.takenAt,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        medicineId,
        userId,
        logDate,
        scheduledTime,
        status,
        takenAt,
        notes,
      ];
}
