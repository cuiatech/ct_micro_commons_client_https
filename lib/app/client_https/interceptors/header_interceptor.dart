import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flutter/foundation.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  HeaderInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    options.headers["device"] = kIsWeb ? "Web" : "App";

    final prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');

    if (accessToken != null) {
      options.headers['Authorization'] = accessToken;
    }

    print(options.headers);
    print(options.data);

    return handler.next(options);
  }
}
