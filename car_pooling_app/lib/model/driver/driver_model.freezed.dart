// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) {
  return _DriverModel.fromJson(json);
}

/// @nodoc
mixin _$DriverModel {
  String get name => throw _privateConstructorUsedError;
  String get car => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get seats => throw _privateConstructorUsedError;
  int get experience => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverModelCopyWith<DriverModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverModelCopyWith<$Res> {
  factory $DriverModelCopyWith(
          DriverModel value, $Res Function(DriverModel) then) =
      _$DriverModelCopyWithImpl<$Res, DriverModel>;
  @useResult
  $Res call(
      {String name,
      String car,
      String phone,
      String email,
      int seats,
      int experience});
}

/// @nodoc
class _$DriverModelCopyWithImpl<$Res, $Val extends DriverModel>
    implements $DriverModelCopyWith<$Res> {
  _$DriverModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? car = null,
    Object? phone = null,
    Object? email = null,
    Object? seats = null,
    Object? experience = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DriverModelCopyWith<$Res>
    implements $DriverModelCopyWith<$Res> {
  factory _$$_DriverModelCopyWith(
          _$_DriverModel value, $Res Function(_$_DriverModel) then) =
      __$$_DriverModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String car,
      String phone,
      String email,
      int seats,
      int experience});
}

/// @nodoc
class __$$_DriverModelCopyWithImpl<$Res>
    extends _$DriverModelCopyWithImpl<$Res, _$_DriverModel>
    implements _$$_DriverModelCopyWith<$Res> {
  __$$_DriverModelCopyWithImpl(
      _$_DriverModel _value, $Res Function(_$_DriverModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? car = null,
    Object? phone = null,
    Object? email = null,
    Object? seats = null,
    Object? experience = null,
  }) {
    return _then(_$_DriverModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriverModel implements _DriverModel {
  const _$_DriverModel(
      {required this.name,
      required this.car,
      required this.phone,
      required this.email,
      required this.seats,
      required this.experience});

  factory _$_DriverModel.fromJson(Map<String, dynamic> json) =>
      _$$_DriverModelFromJson(json);

  @override
  final String name;
  @override
  final String car;
  @override
  final String phone;
  @override
  final String email;
  @override
  final int seats;
  @override
  final int experience;

  @override
  String toString() {
    return 'DriverModel(name: $name, car: $car, phone: $phone, email: $email, seats: $seats, experience: $experience)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriverModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.experience, experience) ||
                other.experience == experience));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, car, phone, email, seats, experience);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DriverModelCopyWith<_$_DriverModel> get copyWith =>
      __$$_DriverModelCopyWithImpl<_$_DriverModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriverModelToJson(
      this,
    );
  }
}

abstract class _DriverModel implements DriverModel {
  const factory _DriverModel(
      {required final String name,
      required final String car,
      required final String phone,
      required final String email,
      required final int seats,
      required final int experience}) = _$_DriverModel;

  factory _DriverModel.fromJson(Map<String, dynamic> json) =
      _$_DriverModel.fromJson;

  @override
  String get name;
  @override
  String get car;
  @override
  String get phone;
  @override
  String get email;
  @override
  int get seats;
  @override
  int get experience;
  @override
  @JsonKey(ignore: true)
  _$$_DriverModelCopyWith<_$_DriverModel> get copyWith =>
      throw _privateConstructorUsedError;
}
