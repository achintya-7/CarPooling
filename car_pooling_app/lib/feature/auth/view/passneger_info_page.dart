import 'package:car_pooling_app/feature/auth/controller/create_passenger_controller.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:car_pooling_app/widgets/custom_appbar.dart';
import 'package:car_pooling_app/widgets/custom_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PassengerInfoFormPage extends StatelessWidget {
  PassengerInfoFormPage({super.key});

  final TextEditingController _nameController =
      TextEditingController(text: AuthService().getCurrentUser()?.displayName);
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createPassengerController = Get.find<CreatePassengerController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: "User Info"),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(textController: _nameController, hintText: 'Name'),
            CustomTextField(
                size: 10,
                textController: _phoneController,
                hintText: 'Phone',
                keyboardTextType: TextInputType.phone),
            CustomTextField(
                textController: _addressController, hintText: 'Address'),
            CustomTextField(textController: _cityController, hintText: 'City'),
            CustomTextField(
                textController: _stateController, hintText: 'State'),
            CustomTextField(
                textController: _pincodeController,
                hintText: 'Pincode',
                size: 6,
                keyboardTextType: TextInputType.number),
            const SizedBox(
              height: 20,
            ),
            NeumorphicButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _addressController.text.isEmpty ||
                    _cityController.text.isEmpty ||
                    _stateController.text.isEmpty ||
                    _pincodeController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please fill all fields",
                      backgroundColor: Colors.yellow[800],
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return;
                }

                var currentUser = AuthService().getCurrentUser();
                if (currentUser == null) {
                  Fluttertoast.showToast(
                      msg: "Please login first",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return;
                }

                createPassengerController.loginRequest(
                    _nameController.text,
                    _phoneController.text,
                    currentUser.email!,
                    _addressController.text,
                    _cityController.text,
                    _stateController.text,
                    _pincodeController.text,
                    currentUser.uid);
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      )),
    );
  }
}
