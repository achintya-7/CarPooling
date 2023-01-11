// ignore_for_file: avoid_print
import 'package:car_pooling_app/model/Passenger/passenger_model.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreatePassengerController extends GetxController {
  RxBool loading = false.obs;
  late Passenger passenger;

  loginRequest(String name, String phone, String email, String address,
      String city, String state, String pincode, String firebaseId) async {
    showLoading();

    String url = "$apiUrlLocal/passengers";

    Map<String, dynamic> body = {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'firebase_id': firebaseId,
    };

    HttpObject httpObject = await HttpService.postRequest(url, body);

    if (httpObject.statusCode == 200) {
      try {
        passenger = Passenger.fromJson(httpObject.body);
        SecureStorageService.write(passenger.token);
      } on Exception catch (e) {
        print(e);
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
    }
  }

  showLoading() {
    loading.toggle();
  }

  hideLoading() {
    loading.toggle();
  }
}
