import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBarHome({required String title, required RideController rideController}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: NeumorphicAppBar(
      buttonStyle: NeumorphicStyle(
          color: Colors.grey[200],
          depth: 2,
          intensity: 1,
          boxShape: const NeumorphicBoxShape.circle()),
      padding: 6,
      textStyle: TextStyle(fontWeight: FontWeight.values[3]),
      title: Text(title),
      centerTitle: true,
      color: Colors.grey[200],
      actions: [
        NeumorphicButton(
          style: NeumorphicStyle(
              color: Colors.grey[200],
              depth: 2,
              intensity: 1,
              boxShape: const NeumorphicBoxShape.circle()),
          onPressed: () {
            rideController.getCurrentRide();
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ),


        NeumorphicButton(
          style: NeumorphicStyle(
              color: Colors.grey[200],
              depth: 2,
              intensity: 1,
              boxShape: const NeumorphicBoxShape.circle()),
          onPressed: () {
            Get.toNamed('/home/notification');
          },
          child: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),

        
      ],
    ),
  );
}

PreferredSizeWidget customAppBarWithAction({required String title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: NeumorphicAppBar(
      buttonStyle: NeumorphicStyle(
          color: Colors.grey[200],
          depth: 2,
          intensity: 1,
          boxShape: const NeumorphicBoxShape.circle()),
      padding: 6,
      textStyle: TextStyle(fontWeight: FontWeight.values[3]),
      title: Text(title),
      centerTitle: true,
      color: Colors.grey[200],
      actions: [
        NeumorphicButton(
          style: NeumorphicStyle(
              color: Colors.grey[200],
              depth: 2,
              intensity: 1,
              boxShape: const NeumorphicBoxShape.circle()),
          onPressed: () {
            Get.toNamed('/home/notification');
          },
          child: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

PreferredSizeWidget customAppBar({String? title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: NeumorphicAppBar(
      buttonStyle: NeumorphicStyle(
          color: title != null ? Colors.grey[200] : Colors.transparent,
          depth: 2,
          intensity: 1,
          boxShape: const NeumorphicBoxShape.circle()),
      padding: 6,
      textStyle: TextStyle(fontWeight: FontWeight.values[3]),
      title: title != null ? Text(title) : null,
      centerTitle: true,
      color: Colors.grey[200],
    ),
  );
}


