import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';
import 'package:flutter/material.dart';

import '../application/presentation/pages/login/login_page.dart';
import '../constants/constants.dart';

Future<void> config(GetIt injector) async {
  try {
    injector.registerFactory<Widget>(
          () => const LoginPage(),
      instanceName: AppRoute.login,
    );
  } catch (e) {
    dev.log('Config PageDependencies failed');
  }
}
