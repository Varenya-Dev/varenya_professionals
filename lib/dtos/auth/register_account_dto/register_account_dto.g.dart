// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountDto _$RegisterAccountDtoFromJson(Map<String, dynamic> json) {
  return RegisterAccountDto(
    fullName: json['fullName'] as String,
    imageUrl: json['imageUrl'] as String,
    emailAddress: json['emailAddress'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterAccountDtoToJson(RegisterAccountDto instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'fullName': instance.fullName,
      'imageUrl': instance.imageUrl,
    };
