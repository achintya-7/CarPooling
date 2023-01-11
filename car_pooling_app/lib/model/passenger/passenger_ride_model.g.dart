// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_ride_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassengerRide _$$_PassengerRideFromJson(Map<String, dynamic> json) =>
    _$_PassengerRide(
      request_id: json['request_id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      origin_lat: (json['origin_lat'] as num).toDouble(),
      origin_lng: (json['origin_lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PassengerRideToJson(_$_PassengerRide instance) =>
    <String, dynamic>{
      'request_id': instance.request_id,
      'email': instance.email,
      'phone': instance.phone,
      'name': instance.name,
      'origin': instance.origin,
      'origin_lat': instance.origin_lat,
      'origin_lng': instance.origin_lng,
    };
