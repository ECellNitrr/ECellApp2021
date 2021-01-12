import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class SignupRepository {
  /// Takes in `name`, `email`, `password` and `mobileNumber` and returns a success code OR a suitable exception
  Future<void> signup(String name, String email, String password, int mobileNumber);
}

class FakeSignupRepository implements SignupRepository {
  @override
  Future<void> signup(String name, String email, String password, int mobileNumber) async {
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
