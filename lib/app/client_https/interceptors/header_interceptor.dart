// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  HeaderInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    options.headers["device"] = kIsWeb ? "Web" : "App";

    var accessToken = await LocalStorage.get('access_token');

    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }

    print("Request: ${options.method} ${options.baseUrl + options.path}");
    print("Headers: ${options.headers}");
    print("Body: ${options.data}");

    return handler.next(options);
  }
}
