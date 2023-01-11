import 'package:car_pooling_app/feature/profile/controllers/profile_controller.dart';
import 'package:car_pooling_app/model/Passenger/passenger_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/google_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class PassengersInfo extends StatelessWidget {
  const PassengersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final passengerController = Get.find<ProfileController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
          title: AuthService().getCurrentUser()?.displayName ?? "User"),
      body: FutureBuilder(
        future: passengerController.getPassenger(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Passenger? passenger = snapshot.data;
            if (passenger == null) {
              return const Center(
                child: Text("No Data was found"),
              );
            }
            return ProfileViewWidget(passenger: passenger);
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

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({
    Key? key,
    required this.passenger,
  }) : super(key: key);

  final Passenger? passenger;

  @override
  Widget build(BuildContext context) {
    User? user = AuthService().getCurrentUser();
    return Center(
      child: Column(
        children: [
          // * Google Details
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
              child: Neumorphic(
                padding: const EdgeInsets.all(20),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(12),
                  ),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phone",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          passenger?.phone ?? "None",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Address",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          passenger?.address ?? "None",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Location",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          "${passenger?.city ?? "None"}, ${passenger?.state ?? "None"}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pincode",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          passenger?.pincode ?? "None",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          NeumorphicButton(
            onPressed: () => Get.toNamed('passengers/update', arguments: passenger),
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12),
              ),
              depth: 4,
              intensity: 1,
              lightSource: LightSource.topLeft,
            ),
            child: const Text(
              "Update Profile",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
