import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<int> ForgotPassword(String email);
}

class FakeForgotPasswordRepository extends ForgotPasswordRepository {
  @override
  Future<int> ForgotPassword(String email) async {
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      if (Random().nextBool()) {
        return 200;
      } else {
        if (Random().nextBool()) {
          return 400;
        } else {
          return 404;
        }
      }
    }
  }
}
