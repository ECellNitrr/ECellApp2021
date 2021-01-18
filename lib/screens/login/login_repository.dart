import 'dart:convert';
import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      return "Token 9935a8b04f2de7f5dec8f9e92a1893822b034dc7";
    }
  }
}

class APILoginRepository implements LoginRepository {
  @override
  Future<String> login(String email, String password) async {
    http.Response response;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      response = await sharedPreferences.get(S.auth)<http.Client>().post(
        S.loginUrl,
        body: <String, dynamic>{S.emailKey: email, S.passwordKey: password},
      );
    } catch (e) {
      print("NetworkError:" + e);
      throw NetworkException();
    }
  }
}
