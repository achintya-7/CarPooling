import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class DriverHistoryController extends GetxController {
  RxList<Ride> rides = <Ride>[].obs;

  Future getRides() async {
    final response = await HttpService.getRequest("rides/driver/all");

    if (response.statusCode == 200) {
      rides.value = (response.body as List).map((ride) => Ride.fromJson(ride)).toList();
    } else if (response.statusCode == 404) {
      neutralToast("No rides found");
    } else {
      errorToast("Something went wrong");
    }
  }

  completeRide(Ride ride) async {
    final response = await HttpService.getRequest("rides/complete");

    if (response.statusCode == 200) {
      updateFrontEnd(ride);
    } else {
      errorToast("Something went wrong");
    }
  }

  deleteRide(Ride ride) async {
    final response = await HttpService.deleteRequest("rides", null);

    if (response.statusCode == 200) {
      neutralToast("Ride deleted");
      rides.remove(ride);
    } else {
      errorToast("Something went wrong");
    }
  }

  updateFrontEnd(Ride ride) {
    successToast("Ride completed");
    final prevObj = rides.where((x) => x == ride).first;
    final newObj = prevObj.copyWith(complete: true);
    rides.remove(prevObj);
    rides.add(newObj);
    rides.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}
