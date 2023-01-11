// ignore_for_file: avoid_print

import 'package:car_pooling_app/feature/driver/view/driver_home_page.dart';
import 'package:car_pooling_app/feature/driver/view/driver_profile_form_page.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:get/get.dart';

class GetDriverController extends GetxController {
  checkIfDriver() async {
    HttpObject httpObject = await HttpService.getRequest('drivers');
    if (httpObject.statusCode == 200) {
      Get.off(() => const DriverHomePage());
    } else if (httpObject.statusCode == 204) {
      Get.off(() => DriverProfileForm());
    } else {
      Get.back();
    }
  }
}
