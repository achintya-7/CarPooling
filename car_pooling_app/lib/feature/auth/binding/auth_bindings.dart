import 'package:car_pooling_app/feature/auth/controller/create_passenger_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePassengerController>(() => CreatePassengerController());
  }
}
