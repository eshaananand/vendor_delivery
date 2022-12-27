import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:vendor_delivery/components/common_widgets.dart';
import 'package:vendor_delivery/screens/location.dart';
import 'package:vendor_delivery/server/server.dart';
import 'package:vendor_delivery/server/server_constant.dart';
import 'package:vendor_delivery/server/server_query.dart';

import '../screens/auth.dart';
import '../screens/otp.dart';

class VerifyOtpProvider extends ChangeNotifier
    implements ServerOperationCompletion {
  bool _isLoading = false;
  Timer? _timer;
  int _time = 300;

  //getter
  bool get isLoading => _isLoading;
  int get time => _time;
  Timer? get timer=>_timer;

  startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_time == 0) {
          timer.cancel();
        } else {
          _time--;
          notifyListeners();
        }

      },
    );
  }

  verifyOtp(
      {required String number,
      required String otp,
        required bool isReset,
      required BuildContext context}) async {
    _isLoading = true;
    if(isReset){
      _time=300;
    }
    notifyListeners();
    await ServerQuery().post_method(context, ServerConstant.verifyOTP, {"Content-Type":ServerConstant().Header_Content_value},
        {"number": number, "otp": otp}, this);
  }

  @override
  void onError(
      String url, String title, String errormsg, int code, BuildContext context,
      [Response? value]) {
    _isLoading = false;
   if(value!.statusCode==401){
     _timer?.cancel();
     Navigator.push(
         context, MaterialPageRoute(builder: (context) => const Auth()));
    }
   notifyListeners();
    CommonWidgets().showSnackBar(
        context: context,
        color: Colors.red,
        title: json.decode(value.body)["message"] ?? "Something went wrong");

  }

  @override
  void onResponseReceived(String url, Response response, BuildContext context) {
    _isLoading = false;
    if (response.statusCode == 200) {
      _timer?.cancel();
      CommonWidgets().showSnackBar(
          context: context,
          color: Colors.green,
          title:
              json.decode(response.body)["message"] ?? "Something went wrong");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Location()));
    }
    notifyListeners();
  }
}
