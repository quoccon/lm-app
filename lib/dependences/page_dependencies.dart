import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';
import 'package:flutter/material.dart';
import 'package:lifemap/application/presentation/pages/account/account_page.dart';
import 'package:lifemap/application/presentation/pages/chat/chat_page.dart';
import 'package:lifemap/application/presentation/pages/home/home_page.dart';
import 'package:lifemap/application/presentation/pages/noti/noti_page.dart';

import '../application/presentation/pages/login/login_page.dart';
import '../constants/constants.dart';

Future<void> config(GetIt injector) async {
  try {
    injector.registerFactory<Widget>(
          () => const LoginPage(),
      instanceName: AppRoute.login,
    );
    injector.registerFactory<Widget>(
          () => const HomePage(),
      instanceName: AppRoute.home,
    );
    injector.registerFactory<Widget>(
          () => const ChatPage(),
      instanceName: AppRoute.chat,
    );
    injector.registerFactory<Widget>(
          () => const NotiPage(),
      instanceName: AppRoute.noti,
    );
    injector.registerFactory<Widget>(
          () => const AccountPage(),
      instanceName: AppRoute.account,
    );
  } catch (e) {
    dev.log('Config PageDependencies failed');
  }
}
