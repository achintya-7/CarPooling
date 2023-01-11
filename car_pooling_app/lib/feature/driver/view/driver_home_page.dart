import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_search_widget.dart';
import 'package:car_pooling_app/widgets/drawer_driver.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DriverHomePage extends StatelessWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.find<ApiController>();

    return Scaffold(
      appBar: customAppBarWithAction(title: "Home Driver"),
      drawer: const CustomDrawer2(),
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(
          color: Colors.grey[200],
          boxShape: const NeumorphicBoxShape.circle(),
          depth: 8,
          intensity: 1,
        ),
        onPressed: () => Get.toNamed("/DtoP"),
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

            const SizedBox(height: 20),

            NeumorphicButton(
              onPressed: () async {
                if (apiController.placePredictionModel == null) {
                  errorToast("Please select a destination");
                  return;
                }

                // * can be removed
                if (await apiController.prevRideCheck(true)) {
                  Get.toNamed('/drivers/route', arguments: {
                    "toAmity": apiController.searchToggle.value,
                    "placePredictionModel": apiController.placePredictionModel
                  });
                }
              },
              style: buttonStyle,
              child: const Text("Create Ride", style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
