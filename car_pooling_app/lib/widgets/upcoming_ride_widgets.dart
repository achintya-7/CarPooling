import 'package:car_pooling_app/model/rides/rides_model.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:slide_action/slide_action.dart';

// class GetCurrentRideFutureBuilder extends StatelessWidget {
//   const GetCurrentRideFutureBuilder({
//     Key? key,
//     required this.rideController,
//   }) : super(key: key);

//   final RideController rideController;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: rideController.getCurrentRide(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: SpinKitCubeGrid(
//               color: Colors.grey,
//             ),
//           );
//         }

//         if (rideController.currentRide == null) {
//           return const Center(
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("No Upcoming Ride"),
//             ),
//           );
//         }

//         return RideInfoWidget(rideController: rideController);
//       },
//     );
//   }
// }

class RideInfoWidget extends StatelessWidget {
  const RideInfoWidget({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final Ride ride;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        minLeadingWidth: 0,
        child: ExpansionTile(
          textColor: Colors.black,
          collapsedTextColor: Colors.black,
          title: Text(ride.timestamp.toString()),
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
              const SizedBox(height: 6),
              if (ride.started)
                const Text(
                  'Ride Started...',
                  style: TextStyle(color: Colors.green, fontSize: 24),
                )
              else if (ride.email == AuthService().getCurrentUser()?.email)
                const SizedBox(height: 5),
                const SlideToAcceptWidget()
            ],
          ),
          children: ride.passengers
              .map(
                (e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text(
                    e.origin,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  trailing: ride.email == e.email
                      ? const Icon(Icons.local_taxi)
                      : const Icon(Icons.person),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class SlideToAcceptWidget extends StatelessWidget {
  const SlideToAcceptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackHeight: 52,
      trackBuilder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "Swipe to Start Ride",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: state.isPerformingAction
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
          ),
        );
      },
      action: () async {
        // Async operation
        await Future.delayed(
          const Duration(seconds: 2),
          () => debugPrint("Hello World"),
        );
      },
    );
  }
}
