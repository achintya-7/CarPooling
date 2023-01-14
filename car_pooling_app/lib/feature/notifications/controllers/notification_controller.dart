// ignore_for_file: avoid_print

import 'package:car_pooling_app/model/notification/notification_model.dart';
import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Future<List<NotificationModel>> getNotifications() async {
    String url = "notifications";
    List<NotificationModel> notifications = [];

    HttpObject httpObject = await HttpService.getRequest(url);
    if (httpObject.statusCode == 200) {
      notifications = (httpObject.body as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();
    } else if (httpObject.statusCode == 204) {
      notifications = [];
    } else {
      Fluttertoast.showToast(
          msg: "There was an error while fetching notifications",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return notifications;
  }
}
