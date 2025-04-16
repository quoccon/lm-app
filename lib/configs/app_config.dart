import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import '../dependences/dependencies.dart' as di;
import 'dart:developer' as dev;

import '../constants/constants.dart';
import 'configs.dart';

class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig(){
    return _singleton;
  }

  AppConfig._internal();

  Future<void> configApp({required Env env}) async {
    try {
      dev.log('Starting AppConfig for env: ${env.value}');
      await _configEnv(env: env);
      await _configDi();
      _configUI();
      dev.log('AppConfig completed');
    } catch (e, stackTrace) {
      dev.log('AppConfig failed: $e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  void _configUI() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..textColor = TextColor.inverse
      ..backgroundColor = Colors.transparent
      ..boxShadow = []
      ..maskColor = TextColor.primary.withOpacity(0.6)
      ..indicatorColor = TextColor.inverse
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  Future _configEnv({required Env env}) async {
    await EnvConfig().load(envStr: env.value);
  }
  Future _configDi() async {
    await di.init();
  }
}