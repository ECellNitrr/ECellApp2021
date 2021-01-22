import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/user.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileRepository {
  /// Takes in `token` , gives the user details and throws a suitable exception if something goes wrong.
  Future<User> profile(String token);
}

class FakeProfileRepository implements ProfileRepository {
  @override
  Future<User> profile(String token) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      var json = {
        "first_name": "Sahil",
        "last_name": "Silare",
        "email": "sahil@gmail.com",
        "contact": "",
      };
      User user = User.fromJson(json);
      // fake successful response (the data entered here same as in the API Doc example)
      return user;
    }
  }
}
