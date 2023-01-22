// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:car_pooling_app/service/http_model.dart';
import 'package:car_pooling_app/utils/constants.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<HttpObject> postRequestWithoutToken(
      String route, Map<String, dynamic> jsonMap) async {
    String url = apiUrlLocal + route;
    String body = json.encode(jsonMap);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return HttpObject(body: body, statusCode: response.statusCode);
      } else {
        print(response.body);
        return HttpObject(body: null, statusCode: response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
      return HttpObject(body: null, statusCode: 666);
    }
  }

  static Future<HttpObject> getRequest(String route) async {
    String url = apiUrlLocal + route;
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await SecureStorageService.read() ?? 'null'}'
      });
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return HttpObject(body: body, statusCode: response.statusCode);
      } else {
        print(response.statusCode);
        print(response.body);
        return HttpObject(body: null, statusCode: response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
      return HttpObject(body: null, statusCode: 666);
    }
  }

  static Future<HttpObject> postRequest(
      String route, Map<String, dynamic> jsonMap) async {
    String url = apiUrlLocal + route;
    String body = json.encode(jsonMap);
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${await SecureStorageService.read() ?? 'null'}'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return HttpObject(body: body, statusCode: response.statusCode);
      } else {
        print(response.body);
        return HttpObject(body: null, statusCode: response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
      return HttpObject(body: null, statusCode: 666);
    }
  }

  static Future<HttpObject> deleteRequest(
      String route, Map<String, dynamic>? jsonMap) async {
    print("Started");
    String url = apiUrlLocal + route;
    String body = json.encode(jsonMap);
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${await SecureStorageService.read() ?? 'null'}'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return HttpObject(body: body, statusCode: response.statusCode);
      } else {
        print(response.body);
        return HttpObject(body: null, statusCode: response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
      return HttpObject(body: null, statusCode: 666);
    }
  }

  static Future<HttpObject> putRequest(
      String route, Map<String, dynamic> jsonMap) async {
    String url = apiUrlLocal + route;
    String body = json.encode(jsonMap);

    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${await SecureStorageService.read() ?? 'null'}'
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return HttpObject(body: body, statusCode: response.statusCode);
      } else {
        print(response.statusCode);
        print(response.body);
        return HttpObject(body: null, statusCode: response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
      return HttpObject(body: null, statusCode: 666);
    }
  }
}
