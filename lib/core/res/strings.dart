class S {
  S._();

  // urls
  static const String baseUrl = "http://159.65.158.103:3000/";
  static const String registerUrl = baseUrl + "users/register/";

  // api keys
  static const String passwordKey = "password";
  static const String emailKey = "email";
  static const String firstnameKey = "first_name";
  static const String lastnameKey = "last_name";
  static const String phoneKey = "contact";

  // error strings
  static const String networkException =
      "Request couldn't be completed. Make sure the device is online";
<<<<<<< HEAD

  // url
  static const String url = "http://159.65.158.103:3000/";
  static const String loginUrl = url + "/users/login/";

  //SharedPref Keys
  static const String emailKey = "LoginEmail";
  static const String passwordKey = "PasswordKey";
  static const String tokenKey = "AuthToken";
  static const String auth = "Auth";
=======
  static const String unknownException = "Something went wrong. Please try again later.";
>>>>>>> 24498855f808e32daec0066c8eb8260082483bd8
}
