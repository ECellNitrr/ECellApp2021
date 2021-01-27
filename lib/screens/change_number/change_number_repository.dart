import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ChangeNumberRepository {
  Future<int> getOtp(String number);
}

class FakeChangeNumberRepository extends ChangeNumberRepository {
  String generated;

  @override
  Future<int> getOtp(String number) async {
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) {
      //print("Fail");
      // Represents a network failure
      throw NetworkException();
    } else {
      generated = '1234';
      // returns a dummy otp
      return 1234;
    }
  }

  Future<int> verifyOtp(String sent) async {
    await Future.delayed(Duration(seconds: 1));
    if (sent == generated) {
      return 200;
    } else {
      throw ValidationException("Wrong OTP has been entered");
    }
  }
}
