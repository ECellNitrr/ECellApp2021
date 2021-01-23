import 'dart:math';

import '../../core/res/errors.dart';

abstract class LoginRepository {
  //Takes in login credentials (here id and password)
  //Use by implementing this class
  Future<String> login(String email, String password);
}

class FakeLoginRepository implements LoginRepository {
  @override
  Future<String> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      // fake successful login
      return "Token abcdEfgh";
    }
  }
}
