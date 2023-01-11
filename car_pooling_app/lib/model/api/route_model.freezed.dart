// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) {
  return _RouteModel.fromJson(json);
}

/// @nodoc
mixin _$RouteModel {
  List<Point> get points => throw _privateConstructorUsedError;
  Bounds get bounds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteModelCopyWith<RouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteModelCopyWith<$Res> {
  factory $RouteModelCopyWith(
          RouteModel value, $Res Function(RouteModel) then) =
      _$RouteModelCopyWithImpl<$Res, RouteModel>;
  @useResult
  $Res call({List<Point> points, Bounds bounds});

  $BoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class _$RouteModelCopyWithImpl<$Res, $Val extends RouteModel>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? bounds = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res> get bounds {
    return $BoundsCopyWith<$Res>(_value.bounds, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RouteModelCopyWith<$Res>
    implements $RouteModelCopyWith<$Res> {
  factory _$$_RouteModelCopyWith(
          _$_RouteModel value, $Res Function(_$_RouteModel) then) =
      __$$_RouteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Point> points, Bounds bounds});

  @override
  $BoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class __$$_RouteModelCopyWithImpl<$Res>
    extends _$RouteModelCopyWithImpl<$Res, _$_RouteModel>
    implements _$$_RouteModelCopyWith<$Res> {
  __$$_RouteModelCopyWithImpl(
      _$_RouteModel _value, $Res Function(_$_RouteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? bounds = null,
  }) {
    return _then(_$_RouteModel(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteModel implements _RouteModel {
  const _$_RouteModel({required final List<Point> points, required this.bounds})
      : _points = points;

  factory _$_RouteModel.fromJson(Map<String, dynamic> json) =>
      _$$_RouteModelFromJson(json);

  final List<Point> _points;
  @override
  List<Point> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final Bounds bounds;

  @override
  String toString() {
    return 'RouteModel(points: $points, bounds: $bounds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteModel &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.bounds, bounds) || other.bounds == bounds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_points), bounds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteModelCopyWith<_$_RouteModel> get copyWith =>
      __$$_RouteModelCopyWithImpl<_$_RouteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteModelToJson(
      this,
    );
  }
}

abstract class _RouteModel implements RouteModel {
  const factory _RouteModel(
      {required final List<Point> points,
      required final Bounds bounds}) = _$_RouteModel;

  factory _RouteModel.fromJson(Map<String, dynamic> json) =
      _$_RouteModel.fromJson;

  @override
  List<Point> get points;
  @override
  Bounds get bounds;
  @override
  @JsonKey(ignore: true)
  _$$_RouteModelCopyWith<_$_RouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
mixin _$Point {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$_PointCopyWith(_$_Point value, $Res Function(_$_Point) then) =
      __$$_PointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res, _$_Point>
    implements _$$_PointCopyWith<$Res> {
  __$$_PointCopyWithImpl(_$_Point _value, $Res Function(_$_Point) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_Point(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Point implements _Point {
  const _$_Point({required this.lat, required this.lng});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$$_PointFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'Point(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Point &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointCopyWith<_$_Point> get copyWith =>
      __$$_PointCopyWithImpl<_$_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointToJson(
      this,
    );
  }
}

abstract class _Point implements Point {
  const factory _Point({required final double lat, required final double lng}) =
      _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_PointCopyWith<_$_Point> get copyWith =>
      throw _privateConstructorUsedError;
}

Bounds _$BoundsFromJson(Map<String, dynamic> json) {
  return _Bounds.fromJson(json);
}

/// @nodoc
mixin _$Bounds {
  double get latNE => throw _privateConstructorUsedError;
  double get lngNE => throw _privateConstructorUsedError;
  double get latSW => throw _privateConstructorUsedError;
  double get lngSW => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoundsCopyWith<Bounds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundsCopyWith<$Res> {
  factory $BoundsCopyWith(Bounds value, $Res Function(Bounds) then) =
      _$BoundsCopyWithImpl<$Res, Bounds>;
  @useResult
  $Res call({double latNE, double lngNE, double latSW, double lngSW});
}

/// @nodoc
class _$BoundsCopyWithImpl<$Res, $Val extends Bounds>
    implements $BoundsCopyWith<$Res> {
  _$BoundsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latNE = null,
    Object? lngNE = null,
    Object? latSW = null,
    Object? lngSW = null,
  }) {
    return _then(_value.copyWith(
      latNE: null == latNE
          ? _value.latNE
          : latNE // ignore: cast_nullable_to_non_nullable
              as double,
      lngNE: null == lngNE
          ? _value.lngNE
          : lngNE // ignore: cast_nullable_to_non_nullable
              as double,
      latSW: null == latSW
          ? _value.latSW
          : latSW // ignore: cast_nullable_to_non_nullable
              as double,
      lngSW: null == lngSW
          ? _value.lngSW
          : lngSW // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoundsCopyWith<$Res> implements $BoundsCopyWith<$Res> {
  factory _$$_BoundsCopyWith(_$_Bounds value, $Res Function(_$_Bounds) then) =
      __$$_BoundsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latNE, double lngNE, double latSW, double lngSW});
}

/// @nodoc
class __$$_BoundsCopyWithImpl<$Res>
    extends _$BoundsCopyWithImpl<$Res, _$_Bounds>
    implements _$$_BoundsCopyWith<$Res> {
  __$$_BoundsCopyWithImpl(_$_Bounds _value, $Res Function(_$_Bounds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latNE = null,
    Object? lngNE = null,
    Object? latSW = null,
    Object? lngSW = null,
  }) {
    return _then(_$_Bounds(
      latNE: null == latNE
          ? _value.latNE
          : latNE // ignore: cast_nullable_to_non_nullable
              as double,
      lngNE: null == lngNE
          ? _value.lngNE
          : lngNE // ignore: cast_nullable_to_non_nullable
              as double,
      latSW: null == latSW
          ? _value.latSW
          : latSW // ignore: cast_nullable_to_non_nullable
              as double,
      lngSW: null == lngSW
          ? _value.lngSW
          : lngSW // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bounds implements _Bounds {
  const _$_Bounds(
      {required this.latNE,
      required this.lngNE,
      required this.latSW,
      required this.lngSW});

  factory _$_Bounds.fromJson(Map<String, dynamic> json) =>
      _$$_BoundsFromJson(json);

  @override
  final double latNE;
  @override
  final double lngNE;
  @override
  final double latSW;
  @override
  final double lngSW;

  @override
  String toString() {
    return 'Bounds(latNE: $latNE, lngNE: $lngNE, latSW: $latSW, lngSW: $lngSW)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bounds &&
            (identical(other.latNE, latNE) || other.latNE == latNE) &&
            (identical(other.lngNE, lngNE) || other.lngNE == lngNE) &&
            (identical(other.latSW, latSW) || other.latSW == latSW) &&
            (identical(other.lngSW, lngSW) || other.lngSW == lngSW));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latNE, lngNE, latSW, lngSW);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      __$$_BoundsCopyWithImpl<_$_Bounds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoundsToJson(
      this,
    );
  }
}

abstract class _Bounds implements Bounds {
  const factory _Bounds(
      {required final double latNE,
      required final double lngNE,
      required final double latSW,
      required final double lngSW}) = _$_Bounds;

  factory _Bounds.fromJson(Map<String, dynamic> json) = _$_Bounds.fromJson;

  @override
  double get latNE;
  @override
  double get lngNE;
  @override
  double get latSW;
  @override
  double get lngSW;
  @override
  @JsonKey(ignore: true)
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      throw _privateConstructorUsedError;
}
