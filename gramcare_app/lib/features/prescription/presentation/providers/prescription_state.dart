import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/prescription_entity.dart';

part 'prescription_state.freezed.dart';

@freezed
class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState.initial() = _Initial;
  const factory PrescriptionState.loading() = _Loading;
  const factory PrescriptionState.success(PrescriptionEntity prescription) = _Success;
  const factory PrescriptionState.error(String message) = _Error;
}
