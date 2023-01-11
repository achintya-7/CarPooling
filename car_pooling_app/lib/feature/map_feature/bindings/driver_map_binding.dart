import 'package:car_pooling_app/feature/map_feature/controllers/driver_map_controller.dart';
import 'package:get/get.dart';

class DriverMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverMapController>(() => DriverMapController());
  }
}