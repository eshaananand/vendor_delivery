import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:vendor_delivery/components/common_widgets.dart';
import 'package:vendor_delivery/server/server.dart';

import '../server/server_constant.dart';
import '../server/server_query.dart';

class UserDataProvider extends ChangeNotifier implements ServerOperationCompletion {
   String? myEarnings;

  setOnlineStatus({required BuildContext context, required String status, required String token, required String ridersId}) async {
    await ServerQuery().put_method(context, '${ServerConstant.updateRiderProfile}${ridersId}',
        {"Content-Type": ServerConstant().Header_Content_value, 'jwt': '$token'}, {"status": status}, this);
  }

  getEarnings({required BuildContext context, required String ridersId, required String token}) async {
    await ServerQuery().get_method(
        context, '${ServerConstant.getEarning}${ridersId}', {"Content-Type": ServerConstant().Header_Content_value, 'jwt': '$token'}, this);
  }

  @override
  void onError(String url, String title, String errormsg, int code, BuildContext context, [Response? value]) {
    print('code in error is ${value?.statusCode}');
    if (url.contains(ServerConstant.getEarning) && value?.statusCode != 200 && value?.statusCode != null) {
      CommonWidgets().showSnackBar(context: context, color: Colors.red, title: 'Something went wrong!');
    }
    // TODO: implement onError
  }

  @override
  void onResponseReceived(String url, Response response, BuildContext context) {
    // TODO: implement onResponseReceived
    print('url isb ${url}');

    if (url.contains(ServerConstant.getEarning)) {
      try {
        var data = json.decode(response.body.toString());
        print('push to screen');

        myEarnings = data['data'].toString();
        print('push to screen');
      } catch (e) {
        print('error r in get earnings is ${e}');
      }
    }
  }
}
