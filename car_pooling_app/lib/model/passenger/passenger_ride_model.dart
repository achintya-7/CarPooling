import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_ride_model.freezed.dart';
part 'passenger_ride_model.g.dart';

@freezed
class PassengerRide with _$PassengerRide {
  const factory PassengerRide({
    required String request_id,
    required String email,
    required String phone,
    required String name,
    required String origin,
    required String origin_id,
  }) = _PassengerRide;

  factory PassengerRide.fromJson(Map<String, dynamic> json) =>
      _$PassengerRideFromJson(json);
}