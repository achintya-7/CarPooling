// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestsModel _$$_RequestsModelFromJson(Map<String, dynamic> json) =>
    _$_RequestsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      ride_id: json['ride_id'] as String,
      origin: json['origin'] as String,
      origin_id: json['origin_id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      timestamp: json['timestamp'] as int,
      status: json['status'] as int,
      driver_name: json['driver_name'] as String,
      ride_origin: json['ride_origin'] as String,
      ride_destination: json['ride_destination'] as String,
      ride_timestamp: json['ride_timestamp'] as int,
    );

Map<String, dynamic> _$$_RequestsModelToJson(_$_RequestsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ride_id': instance.ride_id,
      'origin': instance.origin,
      'origin_id': instance.origin_id,
      'email': instance.email,
      'phone': instance.phone,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'driver_name': instance.driver_name,
      'ride_origin': instance.ride_origin,
      'ride_destination': instance.ride_destination,
      'ride_timestamp': instance.ride_timestamp,
    };
