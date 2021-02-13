class S {
  S._();

  // urls
  static const String baseUrl = "http://159.65.158.103:3000/";
  static const String loginUrl = baseUrl + "users/login/";
  static const String registerUrl = baseUrl + "users/register/";
  static const String getUserDetailsUrl = baseUrl + "users/get_user_details/";
  static const String getEventsUrl = baseUrl + "events/list/2019/";
  static const String getSpeakerUrl = baseUrl + "speakers/full_list/";
  // shared preferences keys
  static const String tokenKeySharedPreferences = "token";
  // api keys
  static const String tokenKey = "token";
  static const String passwordKey = "password";
  static const String emailKey = "email";
  static const String firstnameKey = "first_name";
  static const String lastnameKey = "last_name";
  static const String phoneKey = "contact";
  //event
  static const String eventnameKey = "name";
  static const String eventdateKey = "date";
  static const String eventtimeKey = "time";
  static const String eventvenueKey = "venue";
  static const String eventidKey = "id";
  static const String eventdetailsKey = "details";
  static const String eventiconurlKey = "icon";
  //speaker
  static const String speakerCompany = "company";
  static const String speakerDescription = "description";
  static const String speakerExperience = "experience";
  static const String speakerId = "id";
  static const String speakerName = "name";
  static const String speakerProfilePic = "profile_pic";
  static const String speakerSocialMedia = "social_media";
  static const String speakerYear = "year";

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
  static const String assetEsummitLogoWhiteFilled = "assets/esummit-filled-logo.png";
  static const String assetSponsorsLogoWhite = "assets/sponsors-logo.png";
  static const String assetEventsLogoWhite = "assets/events-logo.png";

  // paragraphs
  static const String esummitPara =
      "we aspire to create a melange of eminent speakers who have proved themselves in diverse fields and are at the zenith of glory. E-Summit'21 will not just be a conclave of innovative minds and epistemic elocutionists, but it will be the place where ideas not only thrive but become the greatest revelations of the century.";
}
