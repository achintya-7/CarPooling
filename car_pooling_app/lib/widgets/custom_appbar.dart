import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBarHome({required String title, required RideController rideController}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.grey[200],
      actions: [
        IconButton(
          onPressed: () {
            rideController.getCurrentRide(true);
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ),


        IconButton(
          onPressed: () {
            Get.toNamed('/home/notification');
          },
          icon: const Icon(
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
    child: AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.grey[200],
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed('/home/notification');
          },
          icon: const Icon(
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
    child: AppBar(
      title: title != null ? Text(title) : null,
      centerTitle: true,
      backgroundColor: Colors.grey[200],
    ),
  );
}


