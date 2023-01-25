// ignore_for_file: non_constant_identifier_names

import 'package:car_pooling_app/model/passenger/passenger_ride_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rides_model.freezed.dart';
part 'rides_model.g.dart';


@freezed
class Ride with _$Ride {
  const factory Ride({
    required String name,
    required String id,
    required String origin,
    required String destination,
    required int seats,
    required int price,
    required String place_id,
    required String email,
    required String phone,       
    required int timestamp,
    required List<PassengerRide> passengers,
    required bool complete,
    required String gender,
    required bool started
  }) = _Ride;


factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

}