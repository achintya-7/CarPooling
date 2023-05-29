// ignore_for_file: avoid_print
import 'package:car_pooling_app/model/passenger/passenger_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreatePassengerController extends GetxController {
  RxBool loading = false.obs;
  late Passenger passenger;

  loginRequest(String name, String phone, String email, String address,
      String city, String state, String pincode, String firebaseId, String dropdownValue) async {
    showLoading();

    Map<String, dynamic> body = {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'firebase_id': firebaseId,
      'gender': dropdownValue,
    };

    HttpObject httpObject = await HttpService.postRequest("passengers", body);

    if (httpObject.statusCode == 200) {
      try {
        passenger = Passenger.fromJson(httpObject.body);
        await SecureStorageService.delete();
        await SecureStorageService.write(passenger.token);
        Get.toNamed("/home");
      } on Exception catch (e) {
        print(e);
      }
    } else if (httpObject.statusCode == 400) {
      errorToast("Email or Phone already exists");
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
    }
  }

  showLoading() {
    loading.toggle();
  }

  hideLoading() {
    loading.toggle();
  }
}
