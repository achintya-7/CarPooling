// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteModel _$$_RouteModelFromJson(Map<String, dynamic> json) =>
    _$_RouteModel(
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      bounds: Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RouteModelToJson(_$_RouteModel instance) =>
    <String, dynamic>{
      'points': instance.points,
      'bounds': instance.bounds,
    };

_$_Point _$$_PointFromJson(Map<String, dynamic> json) => _$_Point(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PointToJson(_$_Point instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Bounds _$$_BoundsFromJson(Map<String, dynamic> json) => _$_Bounds(
      latNE: (json['latNE'] as num).toDouble(),
      lngNE: (json['lngNE'] as num).toDouble(),
      latSW: (json['latSW'] as num).toDouble(),
      lngSW: (json['lngSW'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BoundsToJson(_$_Bounds instance) => <String, dynamic>{
      'latNE': instance.latNE,
      'lngNE': instance.lngNE,
      'latSW': instance.latSW,
      'lngSW': instance.lngSW,
    };
