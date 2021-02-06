import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<void> sendOTP(String email);

  Future<bool> verifyOTP(String otp);

  Future<void> changePassword(String email, String otp, String password);
}

// To emulate a fake process for forgot password
class FakeForgotPasswordRepository implements ForgotPasswordRepository {
  @override
  // this is to simulate a delay for getting otp
  Future<void> sendOTP(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }

// this to simulate the process of otp verification
  @override
  Future<bool> verifyOTP(String otp) async {
    await Future.delayed(Duration(seconds: 2));
    if (otp == "1234") {
      return true;
    } else {
      return false;
    }
  }

// this is to simulate the process of change in email
  @override
  Future<void> changePassword(String email, String otp, String password) async {
    print(email);
    print(otp);
    print(password);
    await Future.delayed(Duration(seconds: 2));
  }
}
