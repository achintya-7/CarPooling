import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/feature/requests/controllers/driver_request_controller.dart';
import 'package:car_pooling_app/model/requets/requests_model.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/upcoming_ride_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DriverRequestsPage extends StatelessWidget {
  const DriverRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();
    final requestController = Get.find<DriverRequestController>();

    return Scaffold(
      appBar: customAppBar(title: "Requests"),
      body: Center(
        child: Column(
          children: [
            // * Ride Info Widget
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                          "No Rides Found",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ));
                    }

                    return RideInfoWidget(
                        ride: rideController.currentRide.value!);
                  }),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // * Requests List
            Obx(() {
              if (requestController.loading.isTrue) {
                return const Center(child: SpinKitCubeGrid(color: Colors.grey));
              }

              if (requestController.requests.isEmpty) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "No Requests Found",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: requestController.requests.length,
                  itemBuilder: (context, index) {
                    final request = requestController.requests[index];
                    return RequestsWidget(
                        request: request, requestController: requestController);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class RequestsWidget extends StatelessWidget {
  const RequestsWidget({
    Key? key,
    required this.request,
    required this.requestController,
  }) : super(key: key);

  final RequestsModel request;
  final DriverRequestController requestController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          foregroundDecoration:
              requestController.loadingRequests.contains(request.id)
                  ? BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.darken,
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
          child: Card(
            elevation: 4,
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              child: ListTile(
                isThreeLine: true,
                title: Row(
                  children: [
                    const Icon(Icons.person, size: 30),
                    const SizedBox(width: 10),
                    Text(request.name, style: const TextStyle(fontSize: 20)),
                    const Spacer(),
                  ],
                ),

                // * Accept/Reject Buttons
                // trailing: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     IconButton(
                //       constraints: const BoxConstraints(),
                //       onPressed: () async {

                //       },
                //       icon: const Icon(
                //         Icons.check_circle,
                //         color: Colors.green,
                //         size: 40,
                //       ),
                //     ),

                //     const SizedBox(width: 5),

                //     IconButton(
                //       constraints: const BoxConstraints(),
                //       onPressed: () async {

                //       },
                //       icon: const Icon(
                //         Icons.cancel,
                //         size: 40,
                //         color: Colors.red,
                //       ),
                //     ),
                //   ],
                // ),

                subtitle: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [TextSpan(text: request.origin)],
                      ),
                    ),

                    // * Phone Number and Timestamp
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(request.timestamp.toString()),
                        const Spacer(),
                        Text(request.phone),
                        const SizedBox(width: 5),
                        IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () => Clipboard.setData(
                                ClipboardData(text: request.phone)),
                            icon: const Icon(Icons.copy, size: 20))
                      ],
                    ),

                    // * Buttons
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton.tonal(
                            onPressed: () =>
                                requestController.acceptRequest(request),
                            child: const Text("Accept",
                                style: TextStyle(fontSize: 16))),
                        FilledButton.tonal(
                            onPressed: () =>
                                requestController.rejectRequest(request),
                            child: const Text("Decline",
                                style: TextStyle(fontSize: 16))),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
