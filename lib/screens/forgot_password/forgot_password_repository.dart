import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<String> sendOTP(String email);

  Future<String> verifyOTP(String otp);

  Future<String> changePassword(String email, String otp, String password);
}

class FakeForgotPasswordRepository extends ForgotPasswordRepository {
  @override
  // this is to simulate a delay for getting otp
  Future<String> sendOTP(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return "200";
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        if (Random().nextBool()) {
          return "400";
        } else {
          return "404";
        }
      }
    }
  }

// this to simulate the process of otp verification
  @override
  Future<String> verifyOTP(String otp) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      if (otp == "1234") {
        return "200";
      } else {
        return "400";
      }
    } else {
      throw NetworkException();
    }
  }

// this is to simulate the process of change in email
  @override
  Future<String> changePassword(String email, String otp, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return "200";
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        return "400";
      }
    }
  }
}
