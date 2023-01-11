// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rides_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ride _$RideFromJson(Map<String, dynamic> json) {
  return _Ride.fromJson(json);
}

/// @nodoc
mixin _$Ride {
  String get id => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  int get seats => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get place_id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  List<PassengerRide> get passengers => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RideCopyWith<Ride> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideCopyWith<$Res> {
  factory $RideCopyWith(Ride value, $Res Function(Ride) then) =
      _$RideCopyWithImpl<$Res, Ride>;
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      int seats,
      int price,
      String place_id,
      String email,
      String phone,
      int timestamp,
      List<PassengerRide> passengers,
      bool complete});
}

/// @nodoc
class _$RideCopyWithImpl<$Res, $Val extends Ride>
    implements $RideCopyWith<$Res> {
  _$RideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? seats = null,
    Object? price = null,
    Object? place_id = null,
    Object? email = null,
    Object? phone = null,
    Object? timestamp = null,
    Object? passengers = null,
    Object? complete = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerRide>,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RideCopyWith<$Res> implements $RideCopyWith<$Res> {
  factory _$$_RideCopyWith(_$_Ride value, $Res Function(_$_Ride) then) =
      __$$_RideCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      int seats,
      int price,
      String place_id,
      String email,
      String phone,
      int timestamp,
      List<PassengerRide> passengers,
      bool complete});
}

/// @nodoc
class __$$_RideCopyWithImpl<$Res> extends _$RideCopyWithImpl<$Res, _$_Ride>
    implements _$$_RideCopyWith<$Res> {
  __$$_RideCopyWithImpl(_$_Ride _value, $Res Function(_$_Ride) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? seats = null,
    Object? price = null,
    Object? place_id = null,
    Object? email = null,
    Object? phone = null,
    Object? timestamp = null,
    Object? passengers = null,
    Object? complete = null,
  }) {
    return _then(_$_Ride(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      passengers: null == passengers
          ? _value._passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerRide>,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ride implements _Ride {
  const _$_Ride(
      {required this.id,
      required this.origin,
      required this.destination,
      required this.seats,
      required this.price,
      required this.place_id,
      required this.email,
      required this.phone,
      required this.timestamp,
      required final List<PassengerRide> passengers,
      required this.complete})
      : _passengers = passengers;

  factory _$_Ride.fromJson(Map<String, dynamic> json) => _$$_RideFromJson(json);

  @override
  final String id;
  @override
  final String origin;
  @override
  final String destination;
  @override
  final int seats;
  @override
  final int price;
  @override
  final String place_id;
  @override
  final String email;
  @override
  final String phone;
  @override
  final int timestamp;
  final List<PassengerRide> _passengers;
  @override
  List<PassengerRide> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  @override
  final bool complete;

  @override
  String toString() {
    return 'Ride(id: $id, origin: $origin, destination: $destination, seats: $seats, price: $price, place_id: $place_id, email: $email, phone: $phone, timestamp: $timestamp, passengers: $passengers, complete: $complete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ride &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.place_id, place_id) ||
                other.place_id == place_id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._passengers, _passengers) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      origin,
      destination,
      seats,
      price,
      place_id,
      email,
      phone,
      timestamp,
      const DeepCollectionEquality().hash(_passengers),
      complete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RideCopyWith<_$_Ride> get copyWith =>
      __$$_RideCopyWithImpl<_$_Ride>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RideToJson(
      this,
    );
  }
}

abstract class _Ride implements Ride {
  const factory _Ride(
      {required final String id,
      required final String origin,
      required final String destination,
      required final int seats,
      required final int price,
      required final String place_id,
      required final String email,
      required final String phone,
      required final int timestamp,
      required final List<PassengerRide> passengers,
      required final bool complete}) = _$_Ride;

  factory _Ride.fromJson(Map<String, dynamic> json) = _$_Ride.fromJson;

  @override
  String get id;
  @override
  String get origin;
  @override
  String get destination;
  @override
  int get seats;
  @override
  int get price;
  @override
  String get place_id;
  @override
  String get email;
  @override
  String get phone;
  @override
  int get timestamp;
  @override
  List<PassengerRide> get passengers;
  @override
  bool get complete;
  @override
  @JsonKey(ignore: true)
  _$$_RideCopyWith<_$_Ride> get copyWith => throw _privateConstructorUsedError;
}
