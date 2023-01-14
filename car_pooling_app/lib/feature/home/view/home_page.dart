import 'package:car_pooling_app/feature/driver/view/driver_home_page.dart';
import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_search_widget.dart';
import 'package:car_pooling_app/widgets/drawer_passenger.dart';
import 'package:car_pooling_app/widgets/upcoming_ride_widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.find<ApiController>();
    final rideController = Get.find<RideController>();

    return Scaffold(
      appBar: customAppBarWithAction(title: 'Home'),
      drawer: const CustomDrawer(),
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(
          color: Colors.grey[200],
          boxShape: const NeumorphicBoxShape.circle(),
          depth: 8,
          intensity: 1,
        ),
        onPressed: () => Get.toNamed("/PtoD"),
        child: Center(
          child: NeumorphicIcon(
            Icons.local_taxi,
            style: const NeumorphicStyle(
              color: Colors.black,
            ),
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // TODO: add an image

            const SizedBox(height: 20),

            // * Search Widget
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: apiController.searchToggle.value
                          ? const Offset(1, 0)
                          : const Offset(-1, 0),
                      end: const Offset(0, 0),
                    ).animate(animation),
                    child: child),
                child: apiController.searchToggle.value
                    ? CustomSearchWidget(
                        typeAheadController: apiController.typeAheadController,
                        apiController: apiController,
                      )
                    : CustomSearchWidget2(
                        typeAheadController: apiController.typeAheadController,
                        apiController: apiController),
              ),
            ),

            const SizedBox(height: 10),

            // * Confirm Button
            NeumorphicButton(
              onPressed: () async {
                if (rideController.currentRide == null) {
                  print("Search Rides");
                  return;
                }

                print("No Search Rides");
              },
              style: NeumorphicStyle(
                color: Colors.grey[200],
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(12))),
                depth: 8,
                border: const NeumorphicBorder(width: 2),
                intensity: 1,
              ),
              child: const Text("Search Rides", style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: NeumorphicText(
                  "Upcoming Ride",
                  style: const NeumorphicStyle(
                    color: Colors.black,
                    depth: 5,
                    intensity: 1,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Neumorphic(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: rideController.currentRide == null
                      ? GetCurrentRideFutureBuilder(rideController: rideController)
                      : RideInfoWidget(rideController: rideController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
