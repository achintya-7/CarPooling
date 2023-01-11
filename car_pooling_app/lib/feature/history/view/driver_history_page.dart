import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_pooling_app/feature/history/controller/driver_history_controller.dart';
import 'package:car_pooling_app/feature/history/widgets/driver_history_widget.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DriverHistoryPage extends StatelessWidget {
  DriverHistoryPage({super.key});

  final historyController = Get.find<DriverHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * appbar
      appBar: customAppBar(title: "Ride History"),

      // * body
      body: FutureBuilder(
        future: historyController.getRides(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            if (historyController.rides.isEmpty) {
              return const Center(
                child: Text("No Rides Found"),
              );
            }

            if (historyController.rides[0].timestamp <= DateTime.now().millisecondsSinceEpoch ~/ 1000 &&
                historyController.rides[0].complete == false &&
                historyController.rides[0].email == AuthService().getCurrentUser()?.email) {
              infoToast("Your Ride must be Complete by now. Pls update its status to Create a New Ride"); 
            }
            
            return Obx(
              () => ListView.builder(
                itemCount: historyController.rides.length,
                itemBuilder: (BuildContext context, int index) {
                  return RideHistoryWidget(
                    ride: historyController.rides[index],
                  );
                },
              ),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
