// ignore_for_file: avoid_print, depend_on_referenced_packages
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:flutter/foundation.dart';

class LogInterceptor extends InterceptorsWrapper {
  LogInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    DevLogger.message(
      "Request: ${options.method} ${options.baseUrl + options.path}",
      name: 'LogInterceptor',
    );
    DevLogger.message("Headers: ${options.headers}", name: 'LogInterceptor');
    DevLogger.message("Body: ${options.data}", name: 'LogInterceptor');
    DevLogger.message(
      "==============================================",
      name: 'LogInterceptor',
    );

    return handler.next(options);
  }

  @override
  Future onResponse(Response response, handler) async {
    debugPrint(
      "Response: ${response.statusCode} ${response.data}",
    );
    DevLogger.success(
      "==============================================",
      name: 'LogInterceptor',
    );

    return handler.next(response);
  }

  @override
  Future onError(DioError err, handler) async {
    DevLogger.error("Error: ${err.response?.statusCode}",
        name: 'LogInterceptor');
    DevLogger.error("Error: ${err.message}", name: 'LogInterceptor');
    DevLogger.error(
      "==============================================",
      name: 'LogInterceptor',
    );

    return handler.next(err);
  }
}
