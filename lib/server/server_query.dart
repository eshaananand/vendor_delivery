import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vendor_delivery/server/server_constant.dart';

import 'server.dart';

class ServerQuery {
  Response? responseVale;
  Future<void> post_method(
    BuildContext context,
    String url,
    Map<String, String> header,
    Map<String, dynamic> query,
    ServerOperationCompletion serverOperationCompletion,
  ) async {
    var api_url = ServerConstant().base_url + url;
    print('base url in post method is ${ServerConstant().base_url}');
    print(' url in post method is ${url}');
    print(' url in post method is ${api_url}');

    await http.post(Uri.parse(api_url), headers: header, body: json.encode(query)).then((value) {
      if (value.statusCode == 200) {
        print('-- > post ${value.body.toString()}');
        serverOperationCompletion.onResponseReceived(url, value, context);
      } else if (value.statusCode == 401 || value.statusCode == 400) {
        serverOperationCompletion.onError(url, 'logout_title', 'server_logout_message', value.statusCode, context, value);
      }
      // else if(value.statusCode == 400){
      //   print('response code is ${value.statusCode}');
      // }
      else {
        responseVale = value;
        serverOperationCompletion.onError(url, 'server_error' + value.statusCode.toString(), value.reasonPhrase!, value.statusCode, context, value);
        print("res" + value.reasonPhrase!);
      }
    }).catchError((onError) {
      print('in catch on error');
      serverOperationCompletion.onError(url, "Error", onError.toString(), 0, context, responseVale);
    });
  }

  Future<void> put_method(
    BuildContext context,
    String url,
    Map<String, String> header,
    Map<String, dynamic> query,
    ServerOperationCompletion serverOperationCompletion,
  ) async {
    var api_url = ServerConstant().base_url + url;
    await http.put(Uri.parse(api_url), headers: header, body: json.encode(query)).then((value) {
      if (value.statusCode == 200) {
        serverOperationCompletion.onResponseReceived(url, value, context);
      } else if (value.statusCode == 401 || value.statusCode == 400) {
        serverOperationCompletion.onError(url, 'logout_title', 'server_logout_message', value.statusCode, context, value);
      } else {
        responseVale = value;
        serverOperationCompletion.onError(url, 'server_error' + value.statusCode.toString(), value.reasonPhrase!, value.statusCode, context, value);
      }
    }).catchError((onError) {
      serverOperationCompletion.onError(url, "Error", onError.toString(), 0, context, responseVale);
    });
  }

  Future<void> get_method(BuildContext context, String url, Map<String, String> header, ServerOperationCompletion serverOperationCompletion) async {
    var api_url = ServerConstant().base_url + url;

    await http.get(Uri.parse(api_url), headers: header).then((value) {
      print('value in get method ${value.statusCode} and url --> ${url}');
      if (value.statusCode == 200) {
        serverOperationCompletion.onResponseReceived(url, value, context);
      } else if (value.statusCode == 401) {
        serverOperationCompletion.onError(url, 'logout_title', 'server_logout_message', value.statusCode, context);
      } else {
        serverOperationCompletion.onError(url, 'server_error' + value.statusCode.toString(), value.reasonPhrase!, value.statusCode, context);
        print("res" + value.reasonPhrase!);
      }
    }).catchError((onError) {
      serverOperationCompletion.onError(url, "Error", onError.toString(), 0, context);
    });
  }

  Future<void> get_method_query_parameter(BuildContext context, String url, Map<String, String> header, Map<String, dynamic> query,
      ServerOperationCompletion serverOperationCompletion) async {
    final api_url = Uri.https(ServerConstant().base_url, url, query);
    await http.get(api_url, headers: header).then((value) {
      if (value.statusCode == 200) {
        serverOperationCompletion.onResponseReceived(url, value, context);
      } else if (value.statusCode == 401) {
        serverOperationCompletion.onError(url, 'logout_title', 'server_logout_message', value.statusCode, context);
      } else {
        serverOperationCompletion.onError(url, 'server_error' + value.statusCode.toString(), value.reasonPhrase!, value.statusCode, context, value);
        print("res" + value.reasonPhrase!);
      }
    }).catchError((onError) {
      serverOperationCompletion.onError(url, "Error", onError.toString(), 0, context);
    });
  }

/*  Future<void> post_method_queryparamter(
      BuildContext context,
      String url,
      Map<String, String> header,
      Map<String, dynamic> query,
      ServerOperationCompletion serverOperationCompletion) async {
    try {
      //var api_url = ServerConstant().base_url + url;
      var api_url = url == ServerConstant.saveArticle
          ? ServerConstant().base_url +
              url +
              "?is_saved=${query['is_saved']}&story_id=${query['story_id']}"
          : ServerConstant().base_url +
              url +
              "?is_read=${query['is_read']}&story_id=${query['story_id']}";
      var request = Uri.parse(api_url);
      //var temp = request.replace(queryParameters: query);

      await http.post(request, headers: header).then((value) {
        if (value.statusCode == 200) {
          serverOperationCompletion.onResponseReceived(url, value, context);
        } else if (value.statusCode == 401) {
          serverOperationCompletion.onError(url, 'logout_title',
              'server_logout_message', value.statusCode, context);
        } else {
          serverOperationCompletion.onError(
              url,
              'server_error' + value.statusCode.toString(),
              value.reasonPhrase!,
              value.statusCode,
              context);
          print("res" + value.reasonPhrase!);
        }
      }).catchError((onError) {
        serverOperationCompletion.onError(
            url, "Error", onError.toString(), 0, context);
      });
    } catch (error) {
      print(error);
    }
  }*/
}
