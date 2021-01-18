import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:http/http.dart' as http;

abstract class SignupRepository {
  /// Takes in `firstName`, `lastName`, `email`, `mobileNumber` and `password` and returns a success code OR a suitable exception
  Future<void> signup(
      String firstName, String lastName, String email, String mobileNumber, String password);
}

class FakeSignupRepository implements SignupRepository {
  @override
  Future<void> signup(
      String firstName, String lastName, String email, String mobileNumber, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      // fake successful login
      return;
    }
  }
}

class APISignupRepository implements SignupRepository {
  final String classTag = "APILoginRepository";
  @override
  Future<void> signup(
      String firstName, String lastName, String email, String mobileNumber, String password) async {
    final String tag = classTag + "login";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.registerUrl,
        body: <String, dynamic>{
          S.firstnameKey: firstName.toString(),
          S.lastnameKey: lastName.toString(),
          S.emailKey: email.toString(),
          S.phoneKey: mobileNumber.toString(),
          S.passwordKey: password.toString()
        },
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 201) {
      try {
        Log.d(tag: tag, message: "Signup Successful ");
        return true;
      } catch (e) {
        Log.e(tag: tag, message: "Error while getting response: $e");
        throw UnknownException();
      }
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else {
      throw UnknownException();
    }
  }
}
