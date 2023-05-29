import 'package:car_pooling_app/feature/requests/controllers/passenger_request_controller.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PassengerRequestsPage extends StatelessWidget {
  const PassengerRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final requestController = Get.find<PassengerRequestsController>();
    return Scaffold(
      // * Custom Appbar
      appBar: customAppBar(title: "Requests"),

      // * Body
      body: Center(
        child: Obx(() {
          if (requestController.loading.isTrue) {
            return const SpinKitCubeGrid(
              color: Colors.grey,
            );
          }

          if (requestController.requests.isEmpty) {
            return const Text("No Requests");
          }

          return ListView.builder(
            itemCount: requestController.requests.length,
            itemBuilder: (context, index) {
              final request = requestController.requests[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(request.driver_name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextField(
                          str: request.ride_origin,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.amber[700],
                            size: 15,
                          ),
                        ),
                        customTextField(
                          str: request.origin,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.green[700],
                            size: 18,
                          ),
                        ),
                        customTextField(
                          str: request.ride_destination,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.amber[700],
                            size: 15,
                          ),
                        ),
                        Text("On ${request.ride_timestamp}"),
                      ],
                    ),
                    trailing: request.status == 0
                        ? const Icon(Icons.error, size: 30)
                        : request.status == 1
                            ? const Icon(Icons.check, size: 30, color: Colors.green)
                            : const Icon(Icons.close, size: 30, color: Colors.red),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget customTextField({required String str, required Icon icon}) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 15),
        children: [
          WidgetSpan(
            child: icon,
          ),
          TextSpan(
            text: str,
          )
        ],
      ),
    );
  }
}
