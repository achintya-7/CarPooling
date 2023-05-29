import 'package:animations/animations.dart';
import 'package:car_pooling_app/feature/driver/controllers/driver_profile_form_controller.dart';
import 'package:car_pooling_app/feature/profile/views/update_driver_page.dart';
import 'package:car_pooling_app/model/driver/driver_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/google_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverInfoPage extends StatelessWidget {
  DriverInfoPage({super.key});

  final driverController = Get.find<DriverProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: AuthService().getCurrentUser()?.displayName ?? "User"),
      body: FutureBuilder(
        future: driverController.getDriver(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            DriverModel? driver = snapshot.data;
            if (driver == null) {
              return const Center(
                child: Text("No Data was found"),
              );
            }
            return DriverViewWidget(driver: driver);
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("There was some error"),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DriverViewWidget extends StatelessWidget {
  const DriverViewWidget({super.key, this.driver});

  final DriverModel? driver;

  @override
  Widget build(BuildContext context) {
    User? user = AuthService().getCurrentUser();
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GoogleUserDetails(user: user),
          ),

          // * Details from Server
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(20),
                
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Car",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        driver?.car ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Phone",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        driver?.phone ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Seats",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        driver?.seats.toString() ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Experience (Months)",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        driver?.experience.toString() ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(height: 20),
          OpenContainer(
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            closedBuilder: (context, action) => FilledButton.tonal(
              onPressed: action,//=> Get.toNamed('drivers/update', arguments: driver),
              child: const Text(
                "Update Profile",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            openBuilder: (context, action) => const UpdateDriverPage(),
          )
        ],
      ),
    );
  }
}
