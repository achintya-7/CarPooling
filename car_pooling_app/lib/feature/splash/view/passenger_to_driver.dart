import 'package:car_pooling_app/feature/splash/controllers/get_driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerToDriver extends StatefulWidget {
  const PassengerToDriver({super.key});

  @override
  State<PassengerToDriver> createState() => _PassengerToDriverState();
}

class _PassengerToDriverState extends State<PassengerToDriver> {
  final getDriverController = Get.find<GetDriverController>();

  @override
  void initState() {
    super.initState();
    loadingFunction();
  }

  loadingFunction() async {
    getDriverController.checkIfDriver();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image(
            image: AssetImage('assets/images/car.gif'),
          ),
        ),
      ),
    );
  }
}
