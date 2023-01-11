import 'package:car_pooling_app/feature/driver/controllers/driver_profile_form_controller.dart';
import 'package:car_pooling_app/feature/profile/controllers/profile_controller.dart';
import 'package:car_pooling_app/feature/profile/controllers/update_profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
    Get.lazyPut<DriverProfileController>(() => DriverProfileController());
  }
}
