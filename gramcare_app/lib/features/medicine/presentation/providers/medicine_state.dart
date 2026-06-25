import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/medicine_entity.dart';

part 'medicine_state.freezed.dart';

@freezed
class MedicineState with _$MedicineState {
  const factory MedicineState.initial() = _Initial;
  const factory MedicineState.loading() = _Loading;
  const factory MedicineState.loaded(List<MedicineEntity> medicines) = _Loaded;
  const factory MedicineState.error(String message) = _Error;
}
