import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.g.dart';
part 'route_model.freezed.dart';

@freezed
class RouteModel with _$RouteModel {
  const factory RouteModel({
    required List<Point> points,
    required Bounds bounds,
  }) = _RouteModel;
  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
}

@freezed 
class Point with _$Point {
  const factory Point({
    required double lat,
    required double lng,
  }) = _Point;
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}

@freezed
class Bounds with _$Bounds {
  const factory Bounds({
    required double latNE,
    required double lngNE,
    required double latSW,
    required double lngSW,
  }) = _Bounds;
  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}