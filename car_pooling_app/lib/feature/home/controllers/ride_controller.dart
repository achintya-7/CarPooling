import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class RideController extends GetxController {
  Rx<Ride?> currentRide = Rx<Ride?>(null);
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentRide();
  }

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

  Future getCurrentRide() async {
    toogleLoading();
    final response = await HttpService.getRequest("rides/passenger");
    if (response.statusCode == 200) {
      currentRide.value = Ride.fromJson(response.body);
    } else if (response.statusCode == 204) {
      currentRide.value = null;
    } else {
      errorToast("Something went wrong");
    }
    toogleLoading();
  }

  void toogleLoading() {
    loading.value = !loading.value;
  }
}
