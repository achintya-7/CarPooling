// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_ride_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PassengerRide _$PassengerRideFromJson(Map<String, dynamic> json) {
  return _PassengerRide.fromJson(json);
}

/// @nodoc
mixin _$PassengerRide {
  String get request_id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get origin_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerRideCopyWith<PassengerRide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerRideCopyWith<$Res> {
  factory $PassengerRideCopyWith(
          PassengerRide value, $Res Function(PassengerRide) then) =
      _$PassengerRideCopyWithImpl<$Res, PassengerRide>;
  @useResult
  $Res call(
      {String request_id,
      String email,
      String phone,
      String name,
      String origin,
      String origin_id});
}

/// @nodoc
class _$PassengerRideCopyWithImpl<$Res, $Val extends PassengerRide>
    implements $PassengerRideCopyWith<$Res> {
  _$PassengerRideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request_id = null,
    Object? email = null,
    Object? phone = null,
    Object? name = null,
    Object? origin = null,
    Object? origin_id = null,
  }) {
    return _then(_value.copyWith(
      request_id: null == request_id
          ? _value.request_id
          : request_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      origin_id: null == origin_id
          ? _value.origin_id
          : origin_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassengerRideCopyWith<$Res>
    implements $PassengerRideCopyWith<$Res> {
  factory _$$_PassengerRideCopyWith(
          _$_PassengerRide value, $Res Function(_$_PassengerRide) then) =
      __$$_PassengerRideCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String request_id,
      String email,
      String phone,
      String name,
      String origin,
      String origin_id});
}

/// @nodoc
class __$$_PassengerRideCopyWithImpl<$Res>
    extends _$PassengerRideCopyWithImpl<$Res, _$_PassengerRide>
    implements _$$_PassengerRideCopyWith<$Res> {
  __$$_PassengerRideCopyWithImpl(
      _$_PassengerRide _value, $Res Function(_$_PassengerRide) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request_id = null,
    Object? email = null,
    Object? phone = null,
    Object? name = null,
    Object? origin = null,
    Object? origin_id = null,
  }) {
    return _then(_$_PassengerRide(
      request_id: null == request_id
          ? _value.request_id
          : request_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      origin_id: null == origin_id
          ? _value.origin_id
          : origin_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassengerRide implements _PassengerRide {
  const _$_PassengerRide(
      {required this.request_id,
      required this.email,
      required this.phone,
      required this.name,
      required this.origin,
      required this.origin_id});

  factory _$_PassengerRide.fromJson(Map<String, dynamic> json) =>
      _$$_PassengerRideFromJson(json);

  @override
  final String request_id;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String name;
  @override
  final String origin;
  @override
  final String origin_id;

  @override
  String toString() {
    return 'PassengerRide(request_id: $request_id, email: $email, phone: $phone, name: $name, origin: $origin, origin_id: $origin_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassengerRide &&
            (identical(other.request_id, request_id) ||
                other.request_id == request_id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.origin_id, origin_id) ||
                other.origin_id == origin_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, request_id, email, phone, name, origin, origin_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassengerRideCopyWith<_$_PassengerRide> get copyWith =>
      __$$_PassengerRideCopyWithImpl<_$_PassengerRide>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassengerRideToJson(
      this,
    );
  }
}

abstract class _PassengerRide implements PassengerRide {
  const factory _PassengerRide(
      {required final String request_id,
      required final String email,
      required final String phone,
      required final String name,
      required final String origin,
      required final String origin_id}) = _$_PassengerRide;

  factory _PassengerRide.fromJson(Map<String, dynamic> json) =
      _$_PassengerRide.fromJson;

  @override
  String get request_id;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get name;
  @override
  String get origin;
  @override
  String get origin_id;
  @override
  @JsonKey(ignore: true)
  _$$_PassengerRideCopyWith<_$_PassengerRide> get copyWith =>
      throw _privateConstructorUsedError;
}
