import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}

cacheImagesFromAssets(BuildContext context) {
  precacheImage(const AssetImage('assets/images/car.gif'), context);
}

errorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}  

successToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}  

neutralToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.grey[500],
    textColor: Colors.white,
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