import 'package:car_pooling_app/feature/requests/controllers/passenger_request_controller.dart';
import 'package:get/get.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassengerRequestsController>(() => PassengerRequestsController());
  }
}