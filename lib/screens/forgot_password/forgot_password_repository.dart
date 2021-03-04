import 'dart:convert';
import 'dart:math';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'package:ecellapp/core/res/errors.dart';

abstract class ForgotPasswordRepository {
  Future<void> sendOTP(String email);

  Future<void> checkOTP(String otp, String email);

  Future<void> changePassword(String email, String otp, String password);
}

class FakeForgotPasswordRepository extends ForgotPasswordRepository {
  @override
  // this is to simulate a delay for getting otp
  Future<void> sendOTP(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return;
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        throw ResponseException("Error from sendOTP");
      }
    }
  }

// this to simulate the process of otp verification
  @override
  Future<void> checkOTP(String otp, String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      if (otp == "1234") {
        return;
      } else {
        throw ResponseException("Wrong otp");
      }
    } else {
      throw NetworkException();
    }
  }

// this is to simulate the process of change in email
  @override
  Future<void> changePassword(String email, String otp, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      return;
    } else {
      if (Random().nextBool()) {
        throw NetworkException();
      } else {
        throw ResponseException("Error from changePassword");
      }
    }
  }
}

class APIForgotPasswordRepository extends ForgotPasswordRepository {
  final String classTag = "APIForgotPasswordRepository";

  ///Send [Email] [OTP] [Passoword]
  @override
  Future<void> changePassword(String email, String otp, String password) async {
    final String tag = classTag + "changePassword";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.postChangePasswordUrl,
        body: <String, dynamic>{S.emailKey: email, S.otpKey: otp, S.passwordKey: password},
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 202) {
      try {
        String changePasswordResponse = json.decode(response.body)["detail"];
        return;
      } catch (e) {
        Log.e(tag: tag, message: "Error while decoding response json to get token: $e");
        throw UnknownException();
      }
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      throw ResponseException(jsonDecode(response.body)['detail']);
    } else {
      Log.e(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }

  ///Send [Email] [OTP]
  @override
  Future<void> checkOTP(String otp, String email) async {
    final String tag = classTag + "sendOTP";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.postCheckOtpUrl,
        body: <String, dynamic>{S.emailKey: email, S.otpKey: otp},
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 202) {
      try {
        String otpResponse = json.decode(response.body)["verified"];
        //TODO: Return type to bool
        return otpResponse;
      } catch (e) {
        Log.e(tag: tag, message: "Error while decoding response json to get token: $e");
        throw UnknownException();
      }
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      throw ResponseException(jsonDecode(response.body)['detail']);
    } else {
      Log.e(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }

  /// Send [Email] to server get [OTP] to phone
  @override
  Future<void> sendOTP(String email) async {
    final String tag = classTag + "sendOTP";
    http.Response response;
    try {
      response = await sl.get<http.Client>().post(
        S.postForgotPasswordUrl,
        body: <String, dynamic>{S.emailKey: email},
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 202) {
      try {
        //String otp = json.decode(response.body)["detail"];
        return;
      } catch (e) {
        Log.e(tag: tag, message: "Error while decoding response json to get token: $e");
        throw UnknownException();
      }
    } else if (response.statusCode == 400) {
      throw ValidationException(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      throw ResponseException(jsonDecode(response.body)['detail']);
    } else {
      Log.e(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }
}
