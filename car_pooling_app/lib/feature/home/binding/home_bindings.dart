import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiController>(() => ApiController());
    Get.lazyPut<RideController>(() => RideController());
  }
}
