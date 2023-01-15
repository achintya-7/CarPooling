// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rides_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ride _$$_RideFromJson(Map<String, dynamic> json) => _$_Ride(
      name: json['name'] as String,
      id: json['id'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      seats: json['seats'] as int,
      price: json['price'] as int,
      place_id: json['place_id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      timestamp: json['timestamp'] as int,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => PassengerRide.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['complete'] as bool,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$$_RideToJson(_$_Ride instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'seats': instance.seats,
      'price': instance.price,
      'place_id': instance.place_id,
      'email': instance.email,
      'phone': instance.phone,
      'timestamp': instance.timestamp,
      'passengers': instance.passengers,
      'complete': instance.complete,
      'gender': instance.gender,
    };
