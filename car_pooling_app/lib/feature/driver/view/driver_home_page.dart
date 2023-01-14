import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_search_widget.dart';
import 'package:car_pooling_app/widgets/drawer_driver.dart';
import 'package:car_pooling_app/widgets/upcoming_ride_widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class DriverHomePage extends StatelessWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.find<ApiController>();
    final rideController = Get.find<RideController>();
    GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKeyDrawer,
      backgroundColor: Colors.grey[200],
      appBar: customAppBarWithAction(title: "Home Driver"),
      drawer: CustomDrawer2(drawerKey: scaffoldKeyDrawer),
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(
          color: Colors.grey[200],
          boxShape: const NeumorphicBoxShape.circle(),
          depth: 8,
          intensity: 1,
        ),
        onPressed: () => Get.offNamed('DtoP'),
        child: Center(
          child: NeumorphicIcon(
            Icons.person,
            style: const NeumorphicStyle(
              color: Colors.black,
            ),
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // TODO: add an image

              const SizedBox(height: 20),

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
                          typeAheadController:
                              apiController.typeAheadController,
                          apiController: apiController,
                        )
                      : CustomSearchWidget2(
                          typeAheadController:
                              apiController.typeAheadController,
                          apiController: apiController),
                ),
              ),

              const SizedBox(height: 20),

              NeumorphicButton(
                onPressed: () async {
                  if (rideController.currentRide.value != null) {
                    neutralToast("You already have a ride");
                    return;
                  }

                  if (apiController.placePredictionModel == null) {
                    neutralToast("Please select a destination");
                    return;
                  }

                  Get.toNamed('/drivers/route', arguments: {
                    "toAmity": apiController.searchToggle.value,
                    "placePredictionModel": apiController.placePredictionModel
                  });
                },
                style: buttonStyle,
                child:
                    const Text("Create Ride", style: TextStyle(fontSize: 16)),
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
                    child: Obx(() {
                      if (rideController.loading.isTrue) {
                        return const Center(
                          child: SpinKitCubeGrid(color: Colors.grey),
                        );
                      }

                      if (rideController.currentRide.value == null) {
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                          "No Upcoming Ride",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                            ));
                      }

                      return RideInfoWidget(
                          ride: rideController.currentRide.value!);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
