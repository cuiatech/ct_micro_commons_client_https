import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flutter/foundation.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  HeaderInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    options.headers["device"] = kIsWeb ? "Web" : "App";

    // final currentUser = await _currentUser();
    // if (currentUser != null && currentUser.idToken.isNotEmpty) {
    //   options.headers['Authorization'] = currentUser.idToken;
    // }

    return handler.next(options);
  }
}
