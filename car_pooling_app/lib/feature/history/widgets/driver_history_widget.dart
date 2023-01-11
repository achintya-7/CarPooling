// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_pooling_app/feature/history/controller/driver_history_controller.dart';
import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class RideHistoryWidget extends StatelessWidget {
  RideHistoryWidget({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final Ride ride;

  final historyController = Get.find<DriverHistoryController>();

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
            trailing: ride.complete ? null :  PopUpWidget(historyController: historyController, ride: ride),
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

  final DriverHistoryController historyController;
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
            value: "complete",
            child: Text("Complete"),
          ),
          const PopupMenuItem(
            value: "delete",
            child: Text("Delete"),
          ),
        ];
      },
      onSelected: (String value) {
        if (value == "delete") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Delete Ride"),
              content: const Text("Are you sure you want to Delete this ride?"),
              actions: [
                NeumorphicButton(
                    style: NeumorphicStyle(
                      color: Colors.red[300],
                    ),
                    onPressed: () {
                      historyController.deleteRide(ride);
                      Navigator.pop(context);
                    },
                    child: const Text("Yes")),
                NeumorphicButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("No")),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }

        if (value == "complete") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Complete Ride"),
              content:
                  const Text("Are you sure you want to Complete this ride?"),
              actions: [
                NeumorphicButton(
                    style: NeumorphicStyle(
                      color: Colors.green[300],
                    ),
                    onPressed: () {
                      historyController.completeRide(ride);
                      Navigator.pop(context);
                    },
                    child: const Text("Yes")),
                NeumorphicButton(
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



