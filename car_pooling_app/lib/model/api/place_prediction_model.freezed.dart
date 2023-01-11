// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_prediction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePredictionModel _$PlacePredictionModelFromJson(Map<String, dynamic> json) {
  return _PlacePredictionModel.fromJson(json);
}

/// @nodoc
mixin _$PlacePredictionModel {
  String get description => throw _privateConstructorUsedError;
  String get place_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePredictionModelCopyWith<PlacePredictionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePredictionModelCopyWith<$Res> {
  factory $PlacePredictionModelCopyWith(PlacePredictionModel value,
          $Res Function(PlacePredictionModel) then) =
      _$PlacePredictionModelCopyWithImpl<$Res, PlacePredictionModel>;
  @useResult
  $Res call({String description, String place_id});
}

/// @nodoc
class _$PlacePredictionModelCopyWithImpl<$Res,
        $Val extends PlacePredictionModel>
    implements $PlacePredictionModelCopyWith<$Res> {
  _$PlacePredictionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? place_id = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlacePredictionModelCopyWith<$Res>
    implements $PlacePredictionModelCopyWith<$Res> {
  factory _$$_PlacePredictionModelCopyWith(_$_PlacePredictionModel value,
          $Res Function(_$_PlacePredictionModel) then) =
      __$$_PlacePredictionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String place_id});
}

/// @nodoc
class __$$_PlacePredictionModelCopyWithImpl<$Res>
    extends _$PlacePredictionModelCopyWithImpl<$Res, _$_PlacePredictionModel>
    implements _$$_PlacePredictionModelCopyWith<$Res> {
  __$$_PlacePredictionModelCopyWithImpl(_$_PlacePredictionModel _value,
      $Res Function(_$_PlacePredictionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? place_id = null,
  }) {
    return _then(_$_PlacePredictionModel(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacePredictionModel implements _PlacePredictionModel {
  const _$_PlacePredictionModel(
      {required this.description, required this.place_id});

  factory _$_PlacePredictionModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlacePredictionModelFromJson(json);

  @override
  final String description;
  @override
  final String place_id;

  @override
  String toString() {
    return 'PlacePredictionModel(description: $description, place_id: $place_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacePredictionModel &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.place_id, place_id) ||
                other.place_id == place_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, place_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlacePredictionModelCopyWith<_$_PlacePredictionModel> get copyWith =>
      __$$_PlacePredictionModelCopyWithImpl<_$_PlacePredictionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacePredictionModelToJson(
      this,
    );
  }
}

abstract class _PlacePredictionModel implements PlacePredictionModel {
  const factory _PlacePredictionModel(
      {required final String description,
      required final String place_id}) = _$_PlacePredictionModel;

  factory _PlacePredictionModel.fromJson(Map<String, dynamic> json) =
      _$_PlacePredictionModel.fromJson;

  @override
  String get description;
  @override
  String get place_id;
  @override
  @JsonKey(ignore: true)
  _$$_PlacePredictionModelCopyWith<_$_PlacePredictionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
