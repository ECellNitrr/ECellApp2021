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
  static const String unknownException = "Something went wrong. Please try again later.";
}
