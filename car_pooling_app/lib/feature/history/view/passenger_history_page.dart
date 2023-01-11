import 'package:car_pooling_app/feature/history/controller/passenger_history_controller.dart';
import 'package:car_pooling_app/feature/history/widgets/passenger_history_widget.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PassengerHistoryPage extends StatelessWidget {
  const PassengerHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<PassengerHistoryController>();

    return Scaffold(

      // * appbar
      appBar: customAppBar(title: "Ride Hstory"),
      
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

            return Obx(
              () => ListView.builder(
                itemCount: historyController.rides.length,
                itemBuilder: (BuildContext context, int index) {
                  return RideHistoryWidgetPassenger(
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

          return const Center(child: SpinKitCubeGrid(color: Colors.grey));
        },
      ),
  
    );
  }
}
