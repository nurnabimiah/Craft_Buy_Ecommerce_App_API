import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:http/http.dart';

class NetworkUtils {
  /// .............api read get method..............
  Future<dynamic> getMethod(String url, {VoidCallback? onUnauthorized}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await get(uri, headers: {'token': ''});
      print(response.body);
      if (response.statusCode == 200) {
        ///........json file has been encode format..thats why we convert it decode format...
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnauthorized != null) {
          ///............. aita jodi null na hoy tokhn amra execute korabo..................
          onUnauthorized();
        } else {
          log('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// .............api read post method..............
  ///.......... jodi map empty thake tahole amra body akare diye dibo.......
  Future<dynamic> postMethod(String url,
      {VoidCallback? onUnauthorized, Map<String, String>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await post(uri,
          headers: {"Content-Type": "application/json", 'token': ''},
          body: body);
      print(response.body);
      if (response.statusCode == 200) {
        ///........json file has been encode format..thats why we convert it decode format...
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnauthorized != null) {
          ///............. aita jodi null na hoy tokhn amra execute korabo..................
          onUnauthorized();
        } else {
          log('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
