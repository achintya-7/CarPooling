import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> write(String value) async {
    await _storage.write(key: "token", value: value);
  }

  static Future<String?> read() async {
    return await _storage.read(key: "token");
  }

  static Future<void> delete() async {
    await _storage.delete(key: "token");
  }
}

cacheImagesFromAssets(BuildContext context) {
  precacheImage(const AssetImage('assets/images/car.gif'), context);
}

void easyLoadingConfig() {
  EasyLoading.instance.displayDuration = const Duration(milliseconds: 1500);
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.fadingCircle;
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.instance.backgroundColor = Colors.grey[300];
}

errorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

successBox(String msg) {
  EasyLoading.showSuccess(msg);
}

neutralBox(String msg) {
  EasyLoading.showInfo(msg);
}

neutralToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.grey[300],
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

infoToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    timeInSecForIosWeb: 2,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black,
    textColor: Colors.amber,
    fontSize: 16.0,
  );
}
