import 'package:car_pooling_app/feature/profile/controllers/update_profile_controller.dart';
import 'package:car_pooling_app/model/passenger/passenger_model.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Passenger passenger = Get.arguments;

    final updateProfileController = Get.put(UpdateProfileController());

    _nameController.text = passenger.name;
    _phoneController.text = passenger.phone;
    _addressController.text = passenger.address;
    _cityController.text = passenger.city;
    _stateController.text = passenger.state;
    _pincodeController.text = passenger.pincode;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: "Update Profile"),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              CustomTextField(
                  textController: _nameController, hintText: "Name"),
              CustomTextField(
                  textController: _phoneController, hintText: "Phone"),
              CustomTextField(
                  textController: _addressController, hintText: "Address"),
              CustomTextField(
                  textController: _cityController, hintText: "City"),
              CustomTextField(
                  textController: _stateController, hintText: "State"),
              CustomTextField(
                  textController: _pincodeController, hintText: "Pincode"),
              const SizedBox(
                height: 20,
              ),
              FilledButton.tonal(
                onPressed: () async {
                  if (_nameController.text.isEmpty ||
                      _phoneController.text.isEmpty ||
                      _addressController.text.isEmpty ||
                      _cityController.text.isEmpty ||
                      _stateController.text.isEmpty ||
                      _pincodeController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please fill all the fields",
                        backgroundColor: Colors.yellow[700],
                        textColor: Colors.black,
                        gravity: ToastGravity.CENTER,
                        fontSize: 16.0);
                    return;
                  }

                  bool val =
                      await updateProfileController.updatePassengerRequest(
                          _nameController.text,
                          _phoneController.text,
                          _addressController.text,
                          _cityController.text,
                          _stateController.text,
                          _pincodeController.text);

                  if (val) {
                    Get.toNamed("/home");
                  }
                },
                child: const Text("Update"),
              ),
              updateProfileController.loading.value
                  ? const SpinKitCubeGrid(color: Colors.grey)
                  : const SizedBox(),
            ],
          ),
        ),
      )),
    );
  }
}
