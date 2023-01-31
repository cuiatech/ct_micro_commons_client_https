// ignore_for_file: avoid_print

import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  HeaderInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    options.headers['Access-Control-Allow-Origin'] = "*";
    options.headers['Access-Control-Allow-Methods'] =
        "POST, GET, OPTIONS, PUT, DELETE, HEAD";
    options.headers["Access-Control-Allow-Headers"] =
        "Origin, X-Requested-With, Content-Type, Accept";
    options.headers["device"] = kIsWeb ? "Web" : "App";

    var accessToken = await LocalStorage.get('access_token');

    if (accessToken != null) {
      options.headers['Authorization'] = accessToken;
    }

    print("Request: ${options.baseUrl + options.path}");
    print("Headers: ${options.headers}");
    print("Body: ${options.data}");

    return handler.next(options);
  }
}
