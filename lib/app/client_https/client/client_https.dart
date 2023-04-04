// ignore_for_file: depend_on_referenced_packages

import 'package:ct_micro_commons_client_https/app/client_https/interceptors/log_interceptor.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ct_micro_commons_shared/shared/utils/env.dart';

import '../../clients_https_base.dart';
import '../interceptors/header_interceptor.dart';
import '../interceptors/unauthorized_interceptor.dart';

final $ClientHttps = Bind.singleton(
  (i) => ClientHttps(
    interceptors: [
      HeaderInterceptor(),
      LogInterceptor(),
      UnauthorizedInterceptor(),
    ],
  ),
  export: true,
);

class ClientHttps extends ClientHttpsBase {
  ClientHttps({
    List<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  }) : super(
          BaseOptions(
            baseUrl: Modular.get<EnvParams>().baseUrl,
            connectTimeout: 50000,
            receiveTimeout: 50000,
          ),
          interceptors: interceptors,
          httpClientAdapter: httpClientAdapter,
        );
}
