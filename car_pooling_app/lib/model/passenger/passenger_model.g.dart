// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Passenger _$$_PassengerFromJson(Map<String, dynamic> json) => _$_Passenger(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      firabse_id: json['firabse_id'] as String,
      token: json['token'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$$_PassengerToJson(_$_Passenger instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'firabse_id': instance.firabse_id,
      'token': instance.token,
      'gender': instance.gender,
    };
