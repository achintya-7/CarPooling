import 'package:car_pooling_app/feature/history/controller/passenger_history_controller.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideHistoryWidgetPassenger extends StatelessWidget {
  RideHistoryWidgetPassenger({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final Ride ride;

  final historyController = Get.find<PassengerHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: ride.complete ? Colors.green[100] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            tilePadding: const EdgeInsets.only(left: 14, right: 4, top: 2),
            title: Row(
              children: [
                Text(ride.timestamp.toString()),
                const Spacer(),
                Text("Rs. ${ride.price}"),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                RichText(
                  maxLines: 1,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
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
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  maxLines: 1,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
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
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            trailing: ride.email == AuthService().getCurrentUser()?.email && ride.complete == true 
                ? null
                : PopUpWidget(historyController: historyController, ride: ride),
            children: ride.passengers.map((p) {
              return ListTile(
                title: Text(
                  p.name,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  p.phone,
                  style: const TextStyle(color: Colors.black87),
                ),
                trailing: p.email == ride.email
                    ? const Icon(Icons.local_taxi)
                    : const Icon(Icons.person),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({
    Key? key,
    required this.historyController,
    required this.ride,
  }) : super(key: key);

  final PassengerHistoryController historyController;
  final Ride ride;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: "cancel",
            child: Text("Cancel"),
          ),
        ];
      },
      onSelected: (String value) {
        if (value == "cancel") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Cancel Ride"),
              content: ride.timestamp <= DateTime.now().millisecondsSinceEpoch ~/ 100 ? const Text("The Ride has already initiated, Are you sure you want to cancel the Ride") : const Text("Are you sure you want to Delete this ride?"),
              actions: [
                FilledButton.tonal(
  
                    onPressed: () {
                      
                      Navigator.pop(context);
                    },
                    child: const Text("Yes")),
                FilledButton.tonal(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("No")),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }

        
      },
    );
  }
}
