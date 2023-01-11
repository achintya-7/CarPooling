import 'package:car_pooling_app/model/api/place_prediction_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {

  TextEditingController typeAheadController = TextEditingController();

  PlacePredictionModel? placePredictionModel = null.obs.value;
  RxBool searchToggle = true.obs;

  void toggleSearch() {
    searchToggle.value = !searchToggle.value;
  }

  Future<bool> prevRideCheck(bool driver) async {
    final response = await HttpService.getRequest("rides/driver");
    if (response.statusCode == 200) {
      driver ? neutralToast("Please Delete or Complete your current ride") : neutralToast("You already have a ride");
      return false;
    } else if (response.statusCode == 204) {
      return true;
    } else {
      errorToast("Something went wrong");
      return false;
    }
  }

  Future<List<PlacePredictionModel>> getPredictions(String input) async {
    if (input.isEmpty) return [];

    final response = await HttpService.getRequest("api/placePredictions/$input");
    if (response.statusCode == 200) {
      final List<PlacePredictionModel> data = (response.body as List).map((e) => PlacePredictionModel.fromJson(e)).toList();
      return data;
    } else {
      Fluttertoast.showToast(msg: "There was an error with the server", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
      return []; 
    }
  }
}
