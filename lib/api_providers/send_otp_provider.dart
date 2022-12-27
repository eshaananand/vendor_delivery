import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:vendor_delivery/components/common_widgets.dart';
import 'package:vendor_delivery/server/server.dart';
import 'package:vendor_delivery/server/server_constant.dart';
import 'package:vendor_delivery/server/server_query.dart';

import '../screens/otp.dart';

class SendOtpProvider extends ChangeNotifier implements ServerOperationCompletion {
  bool _isLoading = false;
  String _number='';

  //getter
  bool get isLoading => _isLoading;

  sendOtp({required String number, required BuildContext context}) async {
    _isLoading = true;
    _number=number;
    notifyListeners();
   await ServerQuery().post_method(
        context, ServerConstant.sendOTP, {"Content-Type":ServerConstant().Header_Content_value}, {"number": number.toString()}, this);
  }

  @override
  void onError(
      String url, String title, String errormsg, int code, BuildContext context,
      [Response? value]) {
    _isLoading = false;
    CommonWidgets().showSnackBar(
        context: context,
        color: Colors.red,
        title: json.decode(value!.body)["message"] ?? "Something went wrong");
    notifyListeners();
  }

  @override
  void onResponseReceived(String url, Response response, BuildContext context) {
    _isLoading = false;
    if (response.statusCode == 200) {
      CommonWidgets().showSnackBar(
          context: context,
          color: Colors.green,
          title:
              json.decode(response.body)["message"] ?? "Something went wrong");
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Otp(number:_number)));
    }
  }
}
