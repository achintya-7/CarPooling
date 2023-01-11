import 'package:car_pooling_app/feature/home/view/home_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DriverToPassenger extends StatefulWidget {
  const DriverToPassenger({super.key});

  @override
  State<DriverToPassenger> createState() => _DriverToPassengerState();
}

class _DriverToPassengerState extends State<DriverToPassenger> {

  @override
  void initState() {
    super.initState();
    loadingFunction();
  }

  loadingFunction() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.off(() => const HomePage());
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