import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<void> sendOTP(String email);

  Future<void> verifyOTP(String otp);

  Future<void> changePassword(String email, String otp, String password);
}

class FakeForgotPasswordRepository extends ForgotPasswordRepository {
  @override
  // this is to simulate a delay for getting otp
  Future<void> sendOTP(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return "200";
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        throw ResponseException("Error from sendOTP");
      }
    }
  }

// this to simulate the process of otp verification
  @override
  Future<void> verifyOTP(String otp) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      if (otp == "1234") {
        return;
      } else {
        throw ResponseException("Wrong otp");
      }
    } else {
      throw NetworkException();
    }
  }

// this is to simulate the process of change in email
  @override
  Future<void> changePassword(String email, String otp, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return;
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        throw ResponseException("Error from changePassword");
      }
    }
  }
}
