import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<int> generateOTP(String email);

  Future<bool> verifyOTP(String x);
}

class FakeForgotPasswordRepository implements ForgotPasswordRepository {
  int otp;

  @override
  Future<int> generateOTP(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      otp = 1234;
      return 202; // code for successful generation of otp
    }
  }

  Future<bool> verifyOTP(String x) async {
    await Future.delayed(Duration(seconds: 2));
    if (x == "1234") {
      return true;
    } else {
      return false;
    }
  }
}
