class ServerConstant {
  // url
  // var base_url = "https://allinonedelivery.onrender.com/d/";
  var base_url = "https://seal-app-ztj8m.ondigitalocean.app/d/";
  var key_jwt = 'jwt';

  //Header value
  var Header_Content_Key = "Content-Type";
  var Header_Content_value = "application/json";
  var Header_Content_value_multipart = "multipart/form-data";
  var Header_Authorization_KEY = "Authorization";

  var BEARER_TOKEN = "Bearer ";
  //Access token Shared Prefs
  static const String accessTokenSPrefsKey = "accessToken";
  // End Points
  static const String sendOTP = "sendOTP";
  static const String verifyOTP = "verifyOTP";
  static const String riderProfile = "profile";
  static const String updateRiderProfile = "updateProfile/";
  static const String getEarning = "getEarning/";
  static const String transferToWallet = "transferToWallet/";
  static const String payOutRequest = "payOutRequest/";
  // static const String profile = "profile";
}
