import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class RideController extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingSearch = false.obs;
  RxBool ridesFound = true.obs;

  Rx<Ride?> currentRide = Rx<Ride?>(null);
  RxList<Ride> searchedRides = RxList<Ride>([]);
  RxList<String> loadingRides = RxList<String>([]);

  @override
  void onInit() {
    getCurrentRide(true);
    super.onInit();
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

  Future getCurrentRide(bool loading) async {
    if (loading) toogleLoading();
    final response = await HttpService.getRequest("rides/passenger");
    if (response.statusCode == 200) {
      currentRide.value = Ride.fromJson(response.body);
    } else if (response.statusCode == 204) {
      currentRide.value = null;
    } else {
      errorToast("Something went wrong");
    }
    if (loading) toogleLoading();
  }

  Future searchRide(String origin, bool toAmity) async {
    toogleLoadingSearch();

    int booleanNum = toAmity ? 1 : 2;
    final response = await HttpService.getRequest("rides/search/$origin/$booleanNum");
    if (response.statusCode == 200) {
      searchedRides.value = (response.body as List)
          .map((e) => Ride.fromJson(e))
          .toList()
          .cast<Ride>();
    } else if (response.statusCode == 204) {
      searchedRides.value = [];
      ridesFound.value = false;
    } else {
      errorToast("Something went wrong");
    }
    toogleLoadingSearch();
  }

  Future requestRide(
      {required Ride ride,
      required String? origin,
      required String? originId}) async {
    loadingRides.add(ride.id);

    if (origin == null || originId == null) {
      errorToast("Please select a valid origin");
      loadingRides.remove(ride.id);
      return;
    }

    Map<String, dynamic> body = {
      "ride_id": ride.id,
      "origin": origin,
      "origin_id": originId
    };
    final response = await HttpService.postRequest("requests", body);
    if (response.statusCode == 200) {
      removeRide(ride);
      // loadingRides.remove(ride.id);
    } else {
      errorToast("Something went wrong");
    }
    loadingRides.remove(ride.id);
  }

  Future<bool> startRide(String rideId) async {
    final response = await HttpService.getRequest("rides/start/$rideId");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void toogleLoading() {
    loading.value = !loading.value;
  }

  void toogleLoadingSearch() {
    loadingSearch.value = !loadingSearch.value;
  }

  void removeRide(Ride ride) {
    searchedRides.remove(ride);
  }
}
