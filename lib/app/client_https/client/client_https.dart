import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:flutter_modular/flutter_modular.dart';

import '../../clients_https_base.dart';
import '../interceptors/header_interceptor.dart';

final $ClientHttps = Bind.singleton(
  (i) => ClientHttps(
    interceptors: [
      HeaderInterceptor(),
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
            baseUrl: "",
            connectTimeout: 50000,
            receiveTimeout: 50000,
          ),
          interceptors: interceptors,
          httpClientAdapter: httpClientAdapter,
        );
}
