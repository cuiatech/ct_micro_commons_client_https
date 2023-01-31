// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';

import 'client/client_https.dart';

class ClientHttpsModule extends Module {
  @override
  final List<Bind> binds = [
    $ClientHttps,
  ];

  @override
  final List<ModularRoute> routes = [];
}
