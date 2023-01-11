import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction_model.g.dart';
part 'place_prediction_model.freezed.dart';

@freezed
class PlacePredictionModel with _$PlacePredictionModel {
  const factory PlacePredictionModel({
    required String description,
    required String place_id,
  }) = _PlacePredictionModel;
  factory PlacePredictionModel.fromJson(Map<String, dynamic> json) =>
      _$PlacePredictionModelFromJson(json);
}