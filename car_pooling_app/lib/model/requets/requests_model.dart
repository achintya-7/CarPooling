import 'package:freezed_annotation/freezed_annotation.dart';

part 'requests_model.freezed.dart';
part 'requests_model.g.dart';

@freezed
class RequestsModel with _$RequestsModel {
  const RequestsModel._();
  const factory RequestsModel({
    required String id,
    required String name,
    required String ride_id,
    required String origin,
    required String origin_id,
    required String email,
    required String phone,
    required int timestamp,
    required int status,
    required String driver_name,
    required String ride_origin,
    required String ride_destination,
    required int ride_timestamp,
  }) = _RequestsModel;

  factory RequestsModel.fromJson(Map<String, dynamic> json) =>
      _$RequestsModelFromJson(json);
}