import 'package:car_pooling_app/feature/driver/controllers/driver_profile_form_controller.dart';
import 'package:car_pooling_app/feature/splash/controllers/get_driver_controller.dart';
import 'package:get/get.dart';

class GetDriverBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetDriverController>(() => GetDriverController());
    Get.lazyPut<DriverProfileController>(() => DriverProfileController());
  }
}
