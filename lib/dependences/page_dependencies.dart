import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';
import 'package:flutter/material.dart';

import '../application/presentation/pages/pages.dart';
import '../application/presentation/widgets/widget.dart';
import '../constants/constants.dart';

Future<void> config(GetIt injector) async {
  try {
    injector.registerFactory<Widget>(
          () => const LoginPage(),
      instanceName: AppRoute.login,
    );
    injector.registerFactory<Widget>(
          () => const RegisterPage(),
      instanceName: AppRoute.register,
    );
    injector.registerFactory<Widget>(
          () => const MainTabs(),
      instanceName: AppRoute.mainTab,
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
    injector.registerFactory<Widget>(
          () => const VerifyOtpPage(),
      instanceName: AppRoute.verifyOtp,
    );
    injector.registerFactory<Widget>(
          () => const InfoUserPage(),
      instanceName: AppRoute.infoUser,
    );
    injector.registerFactory<Widget>(
          () => const ChallengePage(),
      instanceName: AppRoute.challenge,
    );
    injector.registerFactory<Widget>(
          () => const AchievementsPage(),
      instanceName: AppRoute.achievements,
    );
    injector.registerFactory<Widget>(
          () => const SuggestionPage(),
      instanceName: AppRoute.listSuggest,
    );
    injector.registerFactory<Widget>(
          () => const AddChallengePage(),
      instanceName: AppRoute.addChallenge,
    );
  } catch (e) {
    dev.log('Config PageDependencies failed');
  }
}
