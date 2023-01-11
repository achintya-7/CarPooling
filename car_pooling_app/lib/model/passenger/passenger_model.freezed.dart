// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Passenger _$PassengerFromJson(Map<String, dynamic> json) {
  return _Passenger.fromJson(json);
}

/// @nodoc
mixin _$Passenger {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get firabse_id => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerCopyWith<Passenger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerCopyWith<$Res> {
  factory $PassengerCopyWith(Passenger value, $Res Function(Passenger) then) =
      _$PassengerCopyWithImpl<$Res, Passenger>;
  @useResult
  $Res call(
      {String name,
      String phone,
      String email,
      String address,
      String city,
      String state,
      String pincode,
      String firabse_id,
      String token});
}

/// @nodoc
class _$PassengerCopyWithImpl<$Res, $Val extends Passenger>
    implements $PassengerCopyWith<$Res> {
  _$PassengerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? pincode = null,
    Object? firabse_id = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      firabse_id: null == firabse_id
          ? _value.firabse_id
          : firabse_id // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassengerCopyWith<$Res> implements $PassengerCopyWith<$Res> {
  factory _$$_PassengerCopyWith(
          _$_Passenger value, $Res Function(_$_Passenger) then) =
      __$$_PassengerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String email,
      String address,
      String city,
      String state,
      String pincode,
      String firabse_id,
      String token});
}

/// @nodoc
class __$$_PassengerCopyWithImpl<$Res>
    extends _$PassengerCopyWithImpl<$Res, _$_Passenger>
    implements _$$_PassengerCopyWith<$Res> {
  __$$_PassengerCopyWithImpl(
      _$_Passenger _value, $Res Function(_$_Passenger) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? pincode = null,
    Object? firabse_id = null,
    Object? token = null,
  }) {
    return _then(_$_Passenger(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      firabse_id: null == firabse_id
          ? _value.firabse_id
          : firabse_id // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Passenger implements _Passenger {
  const _$_Passenger(
      {required this.name,
      required this.phone,
      required this.email,
      required this.address,
      required this.city,
      required this.state,
      required this.pincode,
      required this.firabse_id,
      required this.token});

  factory _$_Passenger.fromJson(Map<String, dynamic> json) =>
      _$$_PassengerFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String address;
  @override
  final String city;
  @override
  final String state;
  @override
  final String pincode;
  @override
  final String firabse_id;
  @override
  final String token;

  @override
  String toString() {
    return 'Passenger(name: $name, phone: $phone, email: $email, address: $address, city: $city, state: $state, pincode: $pincode, firabse_id: $firabse_id, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Passenger &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.firabse_id, firabse_id) ||
                other.firabse_id == firabse_id) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email, address,
      city, state, pincode, firabse_id, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassengerCopyWith<_$_Passenger> get copyWith =>
      __$$_PassengerCopyWithImpl<_$_Passenger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassengerToJson(
      this,
    );
  }
}

abstract class _Passenger implements Passenger {
  const factory _Passenger(
      {required final String name,
      required final String phone,
      required final String email,
      required final String address,
      required final String city,
      required final String state,
      required final String pincode,
      required final String firabse_id,
      required final String token}) = _$_Passenger;

  factory _Passenger.fromJson(Map<String, dynamic> json) =
      _$_Passenger.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get address;
  @override
  String get city;
  @override
  String get state;
  @override
  String get pincode;
  @override
  String get firabse_id;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_PassengerCopyWith<_$_Passenger> get copyWith =>
      throw _privateConstructorUsedError;
}
