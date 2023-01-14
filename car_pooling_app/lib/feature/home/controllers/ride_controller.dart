import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class RideController extends GetxController {
  Ride? currentRide;
  Ride? ridePassenger;

  RxBool loadingDriver = false.obs;
  RxBool loadingPassenger = false.obs;

  RxBool isExpanded = false.obs;

  Future<bool> prevRideCheck(bool driver) async {
    final response = await HttpService.getRequest("rides/driver");
    if (response.statusCode == 200) {
      driver
          ? neutralBox("Please Delete or Complete your current ride")
          : neutralBox("You already have a ride");
      return false;
    } else if (response.statusCode == 204) {
      return true;
    } else {
      errorToast("Something went wrong");
      return false;
    }
  }

  Future<Ride?> getCurrentRide() async {
    final response = await HttpService.getRequest("rides/passenger");
    if (response.statusCode == 200) {
      currentRide = Ride.fromJson(response.body);
      return currentRide;
    } else if (response.statusCode == 204) {
      currentRide = null;
      return currentRide;
    } else {
      currentRide = null;
      errorToast("Something went wrong");
      return currentRide;
    }
  }

  Future getCurrentRidePassenger() async {
    toogleLoading2();
    final response = await HttpService.getRequest("rides/passenger");
    if (response.statusCode == 200) {
      ridePassenger = Ride.fromJson(response.body);
    } else if (response.statusCode == 204) {
      ridePassenger = null;
    } else {
      ridePassenger = null;
      errorToast("Something went wrong");
    }
    toogleLoading2();
  }

  void toogleLoading1() {
    loadingDriver.value = !loadingDriver.value;
  }

  void toogleLoading2() {
    loadingPassenger.value = !loadingPassenger.value;
  }
}
