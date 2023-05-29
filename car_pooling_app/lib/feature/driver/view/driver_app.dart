import 'package:car_pooling_app/feature/driver/view/driver_home_page.dart';
import 'package:flutter/material.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DriverHomePage()
    );
  }
}