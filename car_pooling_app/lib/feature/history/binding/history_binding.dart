import 'package:car_pooling_app/feature/history/controller/driver_history_controller.dart';
import 'package:car_pooling_app/feature/history/controller/passenger_history_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassengerHistoryController>(() => PassengerHistoryController());
    Get.lazyPut<DriverHistoryController>(() => DriverHistoryController());
  }
}
