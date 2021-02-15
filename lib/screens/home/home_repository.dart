import 'dart:convert';
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
  /// Fetches `Token` from Shared Preferences , gives the user details and throws a suitable exception if something goes wrong.
  Future<User> getProfile();

  /// Posts the feedback as submitted by the user and throws a suitable exception if something goes wrong.
  Future<void> postFeedback(String feedback);
}

class FakeHomeRepository extends HomeRepository {
  @override
  Future<User> getProfile() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      var response = {
        S.firstnameKey: "Sahil",
        S.lastnameKey: "Silare",
        S.emailKey: "sahil@gmail.com",
        S.phoneKey: "9999999999",
      };

      // fake successful response (the data entered here same as in the API Doc example)
      return User.fromJson(response);
    }
  }

  @override
  Future<void> postFeedback(String feedback) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      // fake successfull operation
      return;
    }
  }
}

class APIHomeRepository extends HomeRepository {
  final String classTag = "APIHomeRepository";
  final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
  @override
  Future<User> getProfile() async {
    String token = sharedPreferences.getString(S.tokenKeySharedPreferences);
    final String tag = classTag + "getUserDetails";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(S.getUserDetailsUrl, headers: <String, String>{
        "Authorization": "$token",
      });
    } catch (e) {
      throw NetworkException();
    }

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw ValidationException(response.body);
    } else {
      Log.s(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }

  @override
  Future<void> postFeedback(String feedback) async {
    sharedPreferences.setString(S.nameKeySharedPreferences, "Siddharth");
    sharedPreferences.setString(S.emailKeySharedPreferences, "smishra1605@gmail.com");
    String name = sharedPreferences.getString(S.nameKeySharedPreferences);
    String email = sharedPreferences.getString(S.emailKeySharedPreferences);
    final String tag = classTag + "postFeedback";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.postFeedbackUrl,
        body: <String, dynamic>{S.nameKey: name, S.emailKey: email, S.feedbackMessageKey: feedback},
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 201) {
      Log.i(tag: tag, message: "Feedback Posted Successfully");
      return true;
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else {
      Log.s(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }
}
