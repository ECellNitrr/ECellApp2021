class S {
  S._();

  // urls
  static const String baseUrl = "http://159.65.158.103:3000/";
  static const String loginUrl = baseUrl + "users/login/";
  static const String registerUrl = baseUrl + "users/register/";
  static const String getUserDetailsUrl = baseUrl + "users/get_user_details/";
  static const String speakerListUrl = baseUrl + "speakers/full_list/";

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
  static const String speakerCompany = "company";
  static const String speakerContact = "contact";
  static const String speakerCreatedAt = "created_at";
  static const String speakerDescription = "description";
  static const String speakerEmail = "email";
  static const String speakerExperience = "experience";
  static const String speakerFlag = "flag";
  static const String speakerId = "id";
  static const String speakerModifiedAt = "modified_at";
  static const String speakerName = "name";
  static const String speakerProfilePic = "profile_pic";
  static const String speakerSocialMedia = "social_media";
  static const String speakerYear = "year";

  // error strings
  static const String networkException =
      "Request couldn't be completed. Make sure the device is online";
  static const String unknownException = "Something went wrong. Please try again later.";
}
