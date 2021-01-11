import 'dart:convert';
import 'dart:math';
import 'package:ecellapp/core/res/strings.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/util/log_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';

abstract class LoginRepository {
  /// Takes in `email` and `password` and returns the user's `token` OR a suitable exception
  Future<String> login(String email, String password);
}

class FakeLoginRepository implements LoginRepository {
  @override
  Future<String> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkError();
    } else {
      // fake data
      return "Token 9935a8b04f2de7f5dec8f9e92a1893822b034dc7";
    }
  }
}

class APILoginRepository implements LoginRepository {
  final String classTag = "APILoginRepository";
  @override
  Future<String> login(String email, String password) async {
    final String tag = classTag + "login";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.loginUrl,
        body: <String, dynamic>{S.emailKey: email, S.passwordKey: password},
      );

      Log.d(tag: classTag + ")login", message: "try block done");
    } catch (e) {
      Log.d(tag: classTag + ":catchNetwork(E)", message: "~");

      Log.e(tag: tag, message: "NetworkError:" + e);
      throw NetworkError();
    }

    if (response.statusCode == 202) {
      try {
        String token = json.decode(response.body)[S.tokenKey];
        Log.d(tag: tag, message: "Login Successful with token: " + token);
        return token;
      } catch (e) {
        Log.e(
            tag: tag,
            message: "Error while decoding response json to get token: $e");
        throw UnknownError();
      }
    } else if (response.statusCode == 400) {
      throw ValidationError(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      throw ResponseException(jsonDecode(response.body)['detail']);
    } else {
      Log.e(
          tag: tag,
          message:
              "Unknown response code -> ${response.statusCode}, message ->" +
                  response.body);
      throw UnknownError();
    }
  }
}
