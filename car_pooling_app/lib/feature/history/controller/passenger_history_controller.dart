import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class PassengerHistoryController extends GetxController {
  RxList<Ride> rides = <Ride>[].obs;

  Future getRides() async {
    final HttpObject response = await HttpService.getRequest('rides/passenger/all');

    if (response.statusCode == 200) {
      rides.value = (response.body as List).map((e) => Ride.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      rides.value = [];
    } else {
      errorToast("Something went wrong");
    }
  }

  cancelRide(Ride ride) async {
    final response = await HttpService.getRequest("rides/cancel");

    if (response.statusCode == 200) {
      updateFrontEnd(ride);
    } else if (response.statusCode == 400) {
      errorToast("Ride owner cant cancel the ride");
    } else {
      errorToast("Something went wrong");
    }
  }
  
  updateFrontEnd(Ride ride) {
    rides.remove(ride);
    neutralBox("Ride cancelled");
  } 
}
