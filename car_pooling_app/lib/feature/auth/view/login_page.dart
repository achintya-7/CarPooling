// ignore_for_file: avoid_print

import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Login"),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              try {
                await AuthService().signInWithGoogle();

                String? token = await SecureStorageService.read();

                // ! if user deletes the app, the token is lost, so we need to check return back a new token if it is DB.
                if (token == null) {
                  // check the database using email
                  final response = await HttpService.postRequestWithoutToken(
                      "passengers/token", <String, dynamic>{
                    "email": AuthService().getCurrentUser()?.email ?? "",
                    "firebase_id": AuthService().getCurrentUser()?.uid ?? ""
                  });

                  if (response.statusCode == 200) {
                    // save the token in secure storage
                    await SecureStorageService.write(response.body["token"]);
                    Get.toNamed("/home");
                  } else {
                    // if user is not found, create a new user
                    Get.toNamed('passenger/form');
                  }
                } else {
                  Get.toNamed("/home");
                }
              } on Exception catch (e) {
                Fluttertoast.showToast(
                  msg: "There was an error with Google Auth",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                print(e);
              }
            },
            child: const Text('Google Login')),
      ),
    );
  }
}
