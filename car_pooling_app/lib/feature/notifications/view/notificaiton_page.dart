import 'package:car_pooling_app/feature/notifications/controllers/notification_controller.dart';
import 'package:car_pooling_app/model/notification/notification_model.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.find<NotificationController>();

    return Scaffold(
      appBar: customAppBar(title: "Notification"),
      body: FutureBuilder<List<NotificationModel>>(
        future: notificationController.getNotifications(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<NotificationModel> notifications = snapshot.data;

            if (notifications.isEmpty) {
              return const Center(
                child: Text("No Notifications"),
              );
            }

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0),
                  child: CustomNotificationListTile(
                      notifications: notifications[index]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("No Notifications"),
            );
          }

          return const Center(
            child: SpinKitCubeGrid(color: Colors.grey),
          );
        },
      ),
    );
  }
}

class CustomNotificationListTile extends StatelessWidget {
  const CustomNotificationListTile({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  final NotificationModel notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(notifications.content),
        subtitle: Text(
          notifications.timestamp.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
