// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:car_pooling_app/feature/home/controllers/api_controller.dart';
import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_search_widget.dart';
import 'package:car_pooling_app/widgets/drawer_passenger.dart';
import 'package:car_pooling_app/widgets/upcoming_ride_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.find<ApiController>();
    final rideController = Get.find<RideController>();

    return Scaffold(
      appBar: customAppBarHome(title: 'Home', rideController: rideController),
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
      body: SingleChildScrollView(
        child: Center(
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
                  if (rideController.currentRide.value != null) {
                    neutralToast("You already have a ride");
                    return;
                  }
      
                  if (apiController.placePredictionModel == null) {
                    neutralToast("Please select a destination");
                    return;
                  }

     
                  rideController.searchRide(
                      apiController.placePredictionModel!.place_id,
                      apiController.searchToggle.value);
                  return;
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
                      child: Obx(() {
                        if (rideController.loading.isTrue) {
                          return const Center(
                              child: SpinKitCubeGrid(color: Colors.grey));
                        }
      
                        if (rideController.currentRide.value == null) {
                          return const Center(
                              child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Search For New Rides",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ));
                        }
      
                        return RideInfoWidget(
                            ride: rideController.currentRide.value!);
                      })),
                ),
              ),
      
              const SizedBox(height: 20),
      
              // * Search Ride List
              SearchRideListWidget(rideController: rideController)
            ],
          ),
        ),
      ),
    );
  }
}

class SearchRideListWidget extends StatelessWidget {
  const SearchRideListWidget({
    Key? key,
    required this.rideController,
  }) : super(key: key);

  final RideController rideController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() {
          if (rideController.loadingSearch.isTrue) {
            return const Center(child: SpinKitCubeGrid(color: Colors.grey));
          }

          if (rideController.searchedRides.isEmpty) {
            if (rideController.ridesFound.isFalse) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "No Rides Found",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              );
            }

            return const Center(child: SizedBox());
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rideController.searchedRides.length,
            itemBuilder: (context, index) {
              final ride = rideController.searchedRides[index];
              return RideSearchInfoWidget(ride: ride, rideController: rideController);
            },
          );
        }),
      ),
    );
  }
}

class RideSearchInfoWidget extends StatelessWidget {
  RideSearchInfoWidget({
    Key? key,
    required this.rideController,
    required this.ride,
  }) : super(key: key);

  final RideController rideController;
  final Ride ride;
  final ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            
            foregroundDecoration: rideController.loadingRides.contains(ride.id)
                ? BoxDecoration(
                    color: Colors.grey,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            child: Card(
                elevation: 4,
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Ride Name and Price
                      Row(
                        children: [
                          Text(
                            ride.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            "Rs. ${ride.price.toString()}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // * Origin and Destination
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis),
                          children: [
                            const WidgetSpan(
                                child: Icon(
                              Icons.place,
                              size: 19,
                              color: Colors.red,
                            )),
                            TextSpan(
                              text: ride.origin,
                            ),
                            const TextSpan(text: " ... "),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis),
                          children: [
                            const WidgetSpan(
                                child: Icon(
                              Icons.place,
                              size: 19,
                              color: Colors.green,
                            )),
                            TextSpan(
                              text: ride.destination,
                            ),
                            const TextSpan(text: " ... "),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // * Date and Time
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          style:
                              const TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            const WidgetSpan(
                                child: Icon(
                              Icons.calendar_today,
                              size: 19,
                              color: Colors.blue,
                            )),
                            TextSpan(
                              text: ride.timestamp.toString(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // * Passengers and Phone Number
                      Row(
                        children: [
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.person,
                                    size: 19,
                                    color: Colors.purple,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${ride.passengers.length.toString()}",
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.phone,
                                    size: 19,
                                    color: Colors.purple,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${ride.phone.toString()}",
                                ),
                                WidgetSpan(
                                  child: IconButton(
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Clipboard.setData(
                                          ClipboardData(text: ride.phone));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      size: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // * Request Ride Button
                      Align(
                        alignment: Alignment.center,
                        child: NeumorphicButton(
                          style: buttonStyle2,
                          onPressed: rideController.loadingRides.contains(ride.id)
                              ? null
                              : () => rideController.requestRide(
                                origin: apiController.placePredictionModel?.description, 
                                originId: apiController.placePredictionModel?.place_id, 
                                ride: ride
                              ),
                          child: const Text("Request Ride"),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
