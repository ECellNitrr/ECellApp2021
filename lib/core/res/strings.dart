class S {
  S._();

  // urls
  static const String baseUrl = "http://159.65.158.103:3000/";
  static const String loginUrl = baseUrl + "users/login/";
  static const String registerUrl = baseUrl + "users/register/";
  static const String getUserDetailsUrl = baseUrl + "users/get_user_details/";
  static const String getEventsUrl = baseUrl + "events/list/2019/";
  static const String getSponsorsUrl = baseUrl + "/sponsors/sorted_list/$sponsorApiYear/";
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
  //sponsors
  static const int sponsorApiYear = 2021;
  static const String sponsorName = "name";
  static const String sponsorDetails = "details";
  static const String sponsorPic = "pic";
  static const String sponsorPicUrl = "pic_url";
  static const String sponsorWebsite = "website";
  static const String sponsorSponsType = "spons_type";
  static const String sponsorContact = "contact";
  static const String sponsorImportance = "importance";
  static const String sponsorCategoryImportance = "category_importance";
  static const String sponsorYear = "year";
  static const String sponsorId = "id";
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
}
