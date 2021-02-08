class S {
  S._();

  // urls
  static const String baseUrl = "http://159.65.158.103:3000/";
  static const String loginUrl = baseUrl + "users/login/";
  static const String registerUrl = baseUrl + "users/register/";
  static const String getUserDetailsUrl = baseUrl + "users/get_user_details/";
  static const String getEventsUrl = baseUrl + "events/list/2019/";

  // api keys
  static const String tokenKey = "token";
  static const String passwordKey = "password";
  static const String emailKey = "email";
  static const String firstnameKey = "first_name";
  static const String lastnameKey = "last_name";
  static const String phoneKey = "contact";
  static const String eventnameKey = "name";
  static const String eventdateKey = "date";
  static const String eventtimeKey = "time";
  static const String eventvenueKey = "venue";
  static const String eventidKey = "id";
  static const String eventdetailsKey = "details";
  static const String eventiconurlKey = "icon";

  // error strings
  static const String networkException =
      "Request couldn't be completed. Make sure the device is online";
  static const String unknownException = "Something went wrong. Please try again later.";

  // asset paths
  static const String assetTopRightBasic = "assets/basic/top-right.png";
  static const String assetBottomLeftBasic = "assets/basic/bottom-left.png";
  static const String assetTopRightColorful = "assets/colorful/top-right.png";
  static const String assetTopLeftColorful = "assets/colorful/top-left.png";
  static const String assetBottomRightColorful = "assets/colorful/bottom-right.png";
  static const String assetBottomLeftColorful = "assets/colorful/bottom-left.png";
  static const String assetEcellLogoWhite = "assets/ecell-logo.png";
  static const String assetEsummitLogoWhite = "assets/esummit-logo.png";

  // paragraphs
  static const String esummitPara =
      "we aspire to create a melange of eminent speakers who have proved themselves in diverse fields and are at the zenith of glory. E-Summit'21 will not just be a conclave of innovative minds and epistemic elocutionists, but it will be the place where ideas not only thrive but become the greatest revelations of the century.";
}
