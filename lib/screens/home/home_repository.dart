import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@immutable
abstract class HomeRepository {
  /// Takes in `token` , gives the user details and throws a suitable exception if something goes wrong.
  Future<User> profile(String token);
}

class FakeHomeRepository implements HomeRepository {
  @override
  Future<User> profile(String token) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      var json = {
        "first_name": "Sahil",
        "last_name": "Silare",
        "email": "sahil@gmail.com",
        "contact": "",
      };
      User user = User.fromJson(json);
      // fake successful response (the data entered here same as in the API Doc example)
      return user;
    }
  }
}

class APIHomeRepository implements HomeRepository {
  final String classTag = "APIHomeRepository";
  @override
  Future<User> profile(String token) async {
    final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
    String token = sharedPreferences.getString(S.tokenKey);
    final String tag = classTag + "getUserDetails";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(
        S.getUserDetailsUrl,
        headers: <String, String>{
          'accept': 'application/json',
          S.tokenKey: token,
        },
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 200) {
      Log.i(tag: tag, message: "Signup Successful ");
      var json = {
        "first_name": response.body[5],
        "last_name": response.body[7],
        "email": response.body[3],
        "contact": response.body[2],
      };
      User user = User.fromJson(json);
      return user;
    } else if (response.statusCode == 401) {
      throw ValidationException(response.body);
    } else {
      Log.s(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }
}
