// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';

class UnauthorizedInterceptor extends InterceptorsWrapper {
  UnauthorizedInterceptor();

  @override
  Future onResponse(Response response, handler) async {
    print("Response: ${response.statusCode} ${response.data}");
    if (response.statusCode == 401 || response.statusCode == 403) {
      await LocalStorage.erase();
      Modular.to.pushReplacementNamed("/");
    }

    return handler.next(response);
  }
}
