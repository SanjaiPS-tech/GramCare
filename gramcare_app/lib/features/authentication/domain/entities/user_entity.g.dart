// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  fullName: json['fullName'] as String,
  languagePreference: json['languagePreference'] as String?,
  role: json['role'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  gender: json['gender'] as String?,
  bloodGroup: json['bloodGroup'] as String?,
  address: json['address'] as String?,
  village: json['village'] as String?,
  district: json['district'] as String?,
  state: json['state'] as String?,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'fullName': instance.fullName,
      'languagePreference': instance.languagePreference,
      'role': instance.role,
      'profileImageUrl': instance.profileImageUrl,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'bloodGroup': instance.bloodGroup,
      'address': instance.address,
      'village': instance.village,
      'district': instance.district,
      'state': instance.state,
      'isActive': instance.isActive,
    };
