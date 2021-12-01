// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      scheduledFor: DateTime.parse(json['scheduledFor'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecode(_$ConfirmationStatusEnumMap, json['status']),
      patientUser:
          ServerUser.fromJson(json['patientUser'] as Map<String, dynamic>),
      doctorUser:
          ServerUser.fromJson(json['doctorUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduledFor': instance.scheduledFor.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': _$ConfirmationStatusEnumMap[instance.status],
      'patientUser': instance.patientUser,
      'doctorUser': instance.doctorUser,
    };

const _$ConfirmationStatusEnumMap = {
  ConfirmationStatus.PENDING: 'PENDING',
  ConfirmationStatus.CONFIRMED: 'CONFIRMED',
};
