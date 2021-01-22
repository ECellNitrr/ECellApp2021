import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileRepository {
  /// Takes in `token` , gives the user details and throws a suitable exception if something goes wrong.
  Future<Map<String, dynamic>> profile(String token);
}

class FakeProfileRepository implements ProfileRepository {
  @override
  Future<Map<String, dynamic>> profile(String token) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      // fake successful login (the data entered here same as in the API Doc example)
      return {
        "applied": true,
        "bquiz_score": 0,
        "contact": "",
        "email": "sahil@gmail.com",
        "facebook": "https://www.facebook.com/ansh.srivastava.77/",
        "first_name": "Sahil",
        "id": 1,
        "last_name": "Silare",
        "linkedin": "https://www.linkedin.com/in/anshsrtv",
        "user_type": "GST",
        "verified": false
      };
    }
  }
}
