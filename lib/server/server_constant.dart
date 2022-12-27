class ServerConstant {
  // url
  var base_url = "https://allinonedelivery.onrender.com/d/";

  //Header value
  var Header_Content_Key = "Content-Type";
  var Header_Content_value = "application/json";
  var Header_Authorization_KEY = "Authorization";

  var BEARER_TOKEN = "Bearer ";
  //Access token Shared Prefs
  static const String accessTokenSPrefsKey = "accessToken";
  // End Points
  static const String sendOTP = "sendOTP";
  static const String verifyOTP = "verifyOTP";
}
