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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      // fake successful login
      sharedPreferences.setString(S.auth, "Token 9935a8b04f2de7f5dec8f9e92a1893822b034dc7");
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
      response = await http.post(
        S.loginUrl,
        body: <String, dynamic>{S.emailKey: email, S.passwordKey: password},
      );
      sharedPreferences.setString(S.auth, json.encode(response));
    } catch (e) {
      throw NetworkException();
    }

    if (response.statusCode == 202) {
      try {
        String token = json.decode(response.body)[S.tokenKey];
        print("Login Successful with token: " + token);
        return token;
      } catch (e) {
        print("Error while decoding response json to get token: $e");
      }
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      throw ResponseException(jsonDecode(response.body)['detail']);
    } else {
      print("Unknown response code -> ${response.statusCode}, message ->" + response.body);
    }
  }
}
