import 'package:car_pooling_app/feature/driver/controllers/driver_profile_form_controller.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DriverProfileForm extends StatelessWidget {
  DriverProfileForm({super.key});

  final TextEditingController _carController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  final driverProfileController = Get.find<DriverProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Driver Form"),
      body: Scaffold(
        body: Center(
          child: Column(
            children: [
              // TODO: Add an image here
              const Spacer(),
              CustomTextField(
                  textController: _carController, hintText: "Car Name"),
              CustomTextField(
                  textController: _seatsController,
                  hintText: "Seats ( Including Yours )",
                  keyboardTextType: TextInputType.number),
              CustomTextField(
                  textController: _experienceController,
                  hintText: "Experience ( In Months )",
                  keyboardTextType: TextInputType.number),
              const SizedBox(height: 10),
              NeumorphicButton(
                onPressed: () {
                  if (_carController.text.isEmpty ||
                      _seatsController.text.isEmpty ||
                      _experienceController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please fill all the fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                  driverProfileController.uploadDriverInfo(
                      _carController.text,
                      _seatsController.text,
                      _experienceController.text);

                },
                child: const Text("Submit"),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
