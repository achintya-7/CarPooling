import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/model/api/route_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class DriverMapController extends GetxController {
  late String origin;
  late String destination;
  RouteModel? routemodel;
  late bool toAmity;
  final rideController = Get.find<RideController>();


  Future<RouteModel?> getRoute(String name, bool toAmity) async {
    this.toAmity = toAmity;
    if (toAmity) {
      origin = name;
      destination = amityAddress;
    } else {
      origin = amityAddress;
      destination = name;
    }

    Map<String, dynamic> jsonMap = {
      "origin": origin,
      "destination": destination,
    };

    // * get route from api
    final HttpObject httpObject = await HttpService.postRequest("api/route", jsonMap);
    if (httpObject.statusCode == 200) {
      routemodel = RouteModel.fromJson(httpObject.body);
    } else {
      errorToast("Error getting route");
    }

    return routemodel;
  }

  confirmRide({required int timestamp, required int price, required String placeiId}) async {
    Map<String, dynamic> jsonMap = {
      "origin": origin,
      "destination": destination,
      "price": price,
      "place_id": placeiId,
      "origin_lat": routemodel!.points[0].lat,
      "origin_lng": routemodel!.points[0].lng,
      "dest_lat": routemodel!.points[routemodel!.points.length - 1].lat,
      "dest_lng": routemodel!.points[routemodel!.points.length - 1].lat,
      "mid_lat": routemodel!.points[routemodel!.points.length ~/ 2].lat,
      "mid_lng": routemodel!.points[routemodel!.points.length ~/ 2].lat,
      "timestamp": timestamp,
      "to_amity": toAmity
    };

    final response = await HttpService.postRequest("rides", jsonMap);
    if (response.statusCode == 200) {
      successBox("Ride Confirmed");
      rideController.getCurrentRide(true);
      Get.back();
      Get.offAndToNamed('/drivers/home');
    } else if (response.statusCode == 409) {
      neutralBox("Please complete or delete your current ride");
      Get.back();
    }
    else {
      errorToast("Error confirming ride");
    }
  }
}
