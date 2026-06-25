import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String phone,
    String? email,
    required String fullName,
    String? languagePreference,
    required String role,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? gender,
    String? bloodGroup,
    String? address,
    String? village,
    String? district,
    String? state,
    @Default(true) bool isActive,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
