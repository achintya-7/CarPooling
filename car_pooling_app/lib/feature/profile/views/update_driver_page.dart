import 'package:car_pooling_app/feature/driver/controllers/driver_profile_form_controller.dart';
import 'package:car_pooling_app/model/driver/driver_model.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UpdateDriverPage extends StatelessWidget {
  const UpdateDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Update Your Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DriverForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverForm extends StatelessWidget {
  DriverForm({super.key});

  final driverController = Get.find<DriverProfileController>();

  final TextEditingController carController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        // TODO: Add an image here
        CustomTextField(textController: carController, hintText: "Car Name"),
        CustomTextField(textController: seatsController, hintText: "Seats ( Including Yours )"),
        CustomTextField(textController: experienceController, hintText: "Experience ( In Months )"),
        const SizedBox(height: 20),
        NeumorphicButton(
          child: const Text("Update"),
          onPressed: () async {
            if (carController.text.isEmpty ||
                seatsController.text.isEmpty ||
                experienceController.text.isEmpty) {
              Fluttertoast.showToast(
                  msg: "Please fill all the fields",
                  backgroundColor: Colors.yellow[700],
                  textColor: Colors.black,
                  fontSize: 16.0);
              return;
            }

            await driverController.updateDriverInfo(carController.text, seatsController.text, experienceController.text);

            return;
          },
        ),
      ],
    );
  }
}
