// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_model.freezed.dart';
part 'passenger_model.g.dart';

@freezed
class Passenger with _$Passenger {
  const factory Passenger({
    required String name,
    required String phone,
    required String email,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required String firabse_id,
    required String token,
  }) = _Passenger;

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);
}