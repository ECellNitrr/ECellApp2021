import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:http/http.dart' as http;

abstract class SignupRepository {
  /// Takes in `firstName`, `lastName`, `email`, `password` and `mobileNumber` and returns a success code OR a suitable exception
  Future<void> signup(
      String firstName, String lastName, String email, String password, int mobileNumber);
}

class FakeSignupRepository implements SignupRepository {
  @override
  Future<void> signup(
      String firstName, String lastName, String email, String password, int mobileNumber) async {
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
  @override
  Future<void> signup(
      String firstName, String lastName, String email, String password, int mobileNumber) async {
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.registerUrl,
        body: <String, dynamic>{
          S.firstnameKey: firstName,
          S.lastnameKey: lastName,
          S.emailKey: email,
          S.phoneKey: mobileNumber,
          S.passwordKey: password
        },
      );
    } catch (e) {
      throw NetworkException();
    }

    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else {
      throw UnknownException();
    }
  }
}
