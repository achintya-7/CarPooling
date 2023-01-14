import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class DriverHistoryController extends GetxController {
  RxList<Ride> rides = <Ride>[].obs;
  final rideController = Get.find<RideController>();

  Future getRides() async {
    final response = await HttpService.getRequest("rides/driver/all");

    if (response.statusCode == 200) {
      rides.value =
          (response.body as List).map((ride) => Ride.fromJson(ride)).toList();
    } else if (response.statusCode == 404) {
      rides.value = [];
    } else {
      errorToast("Something went wrong");
    }
  }

  completeRide(Ride ride, BuildContext context) async {
    final response = await HttpService.getRequest("rides/complete");

    if (response.statusCode == 200) {
      updateFrontEnd(ride);
      rideController.currentRide = null;
      EasyLoading.showSuccess("Ride Completed");
      Get.offAndToNamed('/drivers/home');
    } else {
      Get.back();
      EasyLoading.showError("Something went wrong");
    }
  }

  deleteRide(Ride ride) async {
    final response = await HttpService.deleteRequest("rides", null);
    if (response.statusCode == 200) {
      rides.remove(ride);
      rideController.currentRide = null;
      EasyLoading.showInfo("Ride deleted");
      Get.offAndToNamed('/drivers/home');
    } else {
      EasyLoading.showError("Something went wrong");
    }
  }

  updateFrontEnd(Ride ride) {
    final prevObj = rides.where((x) => x == ride).first;
    final newObj = prevObj.copyWith(complete: true);
    rides.remove(prevObj);
    rides.add(newObj);
    rides.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}
