import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vendor_delivery/server/server_constant.dart';
import 'package:vendor_delivery/server/server_query.dart';

class Server {
  getInstant(
    BuildContext context,
    String url,
    Map<String, String> header,
    Map<String, dynamic> query,
    ServerOperationCompletion serverOperationCompletion,
    String id,
  ) async {
    bool isInternetConnected = await InternetConnectionChecker().hasConnection;
    if (isInternetConnected) {
      switch (url) {
        case ServerConstant.sendOTP:
          ServerQuery().post_method(
              context, url, header, query, serverOperationCompletion);
          break;
        case ServerConstant.verifyOTP:
          ServerQuery().post_method(
              context, url, header, query, serverOperationCompletion);
          break;
      }
    } else {
      serverOperationCompletion.onError(
          url, "Network not available", "Network not available", 0, context);
    }
    ;
  }
}

abstract class ServerOperationCompletion {
  void onResponseReceived(
      String url, Response response, BuildContext context) {}

  void onError(
      String url, String title, String errormsg, int code, BuildContext context,
      [Response? value]) {
    print("error + $code");
  }
}
