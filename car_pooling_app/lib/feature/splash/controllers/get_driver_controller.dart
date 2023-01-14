import 'package:car_pooling_app/feature/driver/view/driver_profile_form_page.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:get/get.dart';

class GetDriverController extends GetxController {
  checkIfDriver() async {
    HttpObject httpObject = await HttpService.getRequest('drivers');
    if (httpObject.statusCode == 200) {
      Get.offNamed("/drivers/home");
    } else if (httpObject.statusCode == 204) {
      // might need to change this
      Get.off(() => DriverProfileForm());
    } else {
      Get.back();
    }
  }
}
