// ignore_for_file: avoid_print

import 'package:car_pooling_app/model/passenger/passenger_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  late Passenger passenger;
  RxBool loading = false.obs;

  Future<bool> updatePassengerRequest(String name, String phone, String address,
      String city, String state, String pincode) async {
    Map<String, dynamic> body = {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
    };

    HttpObject httpObject = await HttpService.putRequest('passengers', body);

    if (httpObject.statusCode == 200) {
      try {
        passenger = Passenger.fromJson(httpObject.body);
        await SecureStorageService.write(passenger.token);
        Fluttertoast.showToast(
            msg: "Profile Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green[500],
            textColor: Colors.white,
            fontSize: 16.0);
        return true;
      } on Exception catch (e) {
        print(e);
        return false;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Error');
      return false;
    }
  }

  showLoading() {
    loading.toggle();
  }

  hideLoading() {
    loading.toggle();
  }
}
