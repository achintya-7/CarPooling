// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverModel _$$_DriverModelFromJson(Map<String, dynamic> json) =>
    _$_DriverModel(
      name: json['name'] as String,
      car: json['car'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      seats: json['seats'] as int,
      experience: json['experience'] as int,
    );

Map<String, dynamic> _$$_DriverModelToJson(_$_DriverModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'car': instance.car,
      'phone': instance.phone,
      'email': instance.email,
      'seats': instance.seats,
      'experience': instance.experience,
    };
