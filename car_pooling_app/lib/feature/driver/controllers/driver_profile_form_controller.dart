import 'package:car_pooling_app/feature/driver/view/driver_app.dart';
import 'package:car_pooling_app/model/driver/driver_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DriverProfileController extends GetxController {
  uploadDriverInfo(String car, String seats, String months) async {
    Map<String, dynamic> jsonMap = {
      'car': car,
      'seats': int.parse(seats),
      'experience': int.parse(months),
    };

    HttpObject httpObject = await HttpService.postRequest('drivers', jsonMap);

    if (httpObject.statusCode == 200) {
      Fluttertoast.showToast(msg: "Info added successfully", backgroundColor: Colors.green, 
        textColor: Colors.white, fontSize: 16.0);
      
      Get.off(() => const DriverApp());
    } else {
      Fluttertoast.showToast(msg: "Error adding info", backgroundColor: Colors.red,
          textColor: Colors.white, fontSize: 16.0);
    }
  }

  Future<DriverModel?> getDriver() async {
    HttpObject httpObject = await HttpService.getRequest("drivers");

    if (httpObject.statusCode == 200) {
      return DriverModel.fromJson(httpObject.body);
    } else if (httpObject.statusCode == 204) {
      Fluttertoast.showToast(
          msg: "No profile found",
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

  updateDriverInfo(String car, String seats, String months) async {
    Map<String, dynamic> jsonMap = {
      'car': car,
      'seats': int.parse(seats),
      'experience': int.parse(months),
    };

    HttpObject httpObject = await HttpService.putRequest('drivers', jsonMap);

    if (httpObject.statusCode == 200) {
      Fluttertoast.showToast(msg: "Info updated successfully", backgroundColor: Colors.green, 
        textColor: Colors.white, fontSize: 16.0);
      
      Get.close(2);
    } else {
      Fluttertoast.showToast(msg: "Error updating info", backgroundColor: Colors.red,
          textColor: Colors.white, fontSize: 16.0);
    }
  }


}
