// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';

class UnauthorizedInterceptor extends InterceptorsWrapper {
  UnauthorizedInterceptor();

  @override
  Future onError(DioError err, handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      DevLogger.error(
        "ERROR: User unauthorized or forbidden",
        name: "UnauthorizedInterceptor",
      );
      await LocalStorage.erase();
      Modular.to.pushReplacementNamed("/");
    }

    return handler.next(err);
  }
}
