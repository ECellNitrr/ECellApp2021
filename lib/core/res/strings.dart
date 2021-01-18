class S {
  S._();

  // error strings
  static const String networkException =
      "Request couldn't be completed. Make sure the device is online";

  // url
  static const String url = "http://159.65.158.103:3000/";
  static const String loginUrl = url + "/users/login/";

  //SharedPref Keys
  static const String emailKey = "LoginEmail";
  static const String passwordKey = "PasswordKey";
  static const String tokenKey = "AuthToken";
  static const String auth = "Auth";
}
