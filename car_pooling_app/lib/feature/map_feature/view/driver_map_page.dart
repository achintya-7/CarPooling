import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_pooling_app/feature/map_feature/controllers/driver_map_controller.dart';
import 'package:car_pooling_app/model/api/place_prediction_model.dart';
import 'package:car_pooling_app/model/api/route_model.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DriverMapPage extends StatelessWidget {
  DriverMapPage({super.key});

  // * Controller
  final routeController = Get.find<DriverMapController>();
  final priceController = TextEditingController();

  // * arguments
  final PlacePredictionModel placePredictionModel = Get.arguments["placePredictionModel"];
  final bool toAmity = Get.arguments["toAmity"];

  // * variables
  final List<LatLng> routePoints = [];

  loadRoute() async {
    RouteModel? routeModel = await routeController.getRoute(
        placePredictionModel.description, toAmity);

    if (routeModel == null) {
      errorToast("Unable to get route");
      routePoints.add(newDelhi);
      Get.back();
      return;
    }

    for (var point in routeModel.points) {
      routePoints.add(LatLng(point.lat, point.lng));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * body
      body: SafeArea(
        child: FutureBuilder(
          future: loadRoute(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FlutterMap(
                options: MapOptions(
                  center: routePoints[0],
                  zoom: 14.0,
                ),
                nonRotatedChildren: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: NeumorphicBackButton(
                        style: buttonStyle3,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: NeumorphicButton(
                        style: buttonStyle2,
                        onPressed: () {
                          dialog(context);
                        },
                        child: const Text("Confirm",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  PolylineLayer(
                    polylineCulling: false,
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: Colors.red,
                        strokeWidth: 4.0,
                      )
                    ],
                  ),
                  MarkerLayerWidget(routePoints: routePoints),
                ],
              );
            }

            return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: FlutterMap(
                  options: MapOptions(
                    center: newDelhi,
                    zoom: 14.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  dialog(BuildContext context) {
    AwesomeDialog(
            context: context,
            animType: AnimType.bottomSlide,
            dialogType: DialogType.noHeader,
            body: Center(
              child: Column(
                children: [
                  const Text("Set Price", style: TextStyle(fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 48.0),
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: "Rs. ",
                        prefixStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        hintText: "Price",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
    
                ],
              )
            ),
            btnOkOnPress: () {
              if (priceController.text.isEmpty) {
                errorToast("Please enter price");
                return;
              }

              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                minTime: DateTime.now(),
                maxTime: DateTime.now().add(const Duration(hours: 24)),
                onConfirm: (date) {
                  routeController.confirmRide(
                    timestamp: date.millisecondsSinceEpoch ~/ 1000, 
                    price: int.parse(priceController.text), 
                    placeiId: placePredictionModel.place_id
                  );
                },
                currentTime: DateTime.now(),
             );
             
          },
          btnOkColor: Colors.grey[300],
          btnOkText: "Set Time",
          buttonsTextStyle: const TextStyle(color: Colors.black),
    ).show();
  }
}

class MarkerLayerWidget extends StatelessWidget {
  const MarkerLayerWidget({
    Key? key,
    required this.routePoints,
  }) : super(key: key);

  final List<LatLng> routePoints;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
            width: 80.0,
            height: 80.0,
            point: routePoints[0],
            builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                  semanticLabel: "Source",
                )),
        Marker(
          width: 80.0,
          height: 80.0,
          point: routePoints[routePoints.length - 1],
          builder: (ctx) => const Icon(
            Icons.location_on,
            color: Colors.green,
            size: 40,
            semanticLabel: "Destination",
          ),
        ),
      ],
    );
  }
}
