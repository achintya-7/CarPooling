import 'package:car_pooling_app/model/passenger/passenger_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Future<Passenger?> getPassenger() async {
    HttpObject httpObject = await HttpService.getRequest("passengers");

    if (httpObject.statusCode == 200) {
      return Passenger.fromJson(httpObject.body);
    } else if (httpObject.statusCode == 401) {
      Fluttertoast.showToast(
          msg: "Unauthorized",
          textColor: Colors.white,
          backgroundColor: Colors.yellow[800]);
      return null;
    } else {
      Fluttertoast.showToast(
          msg: "There was some error with the Server",
          textColor: Colors.white,
          backgroundColor: Colors.red);
      return null;
    }
  }
}
