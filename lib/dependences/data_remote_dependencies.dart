import 'dart:developer' as dev;

import 'package:flutter_cors/flutter_core.dart';

import '../application/datasource/remote/remote.dart';

Future<void> config(GetIt injector) async {
  try {
    injector.registerLazySingleton<AuthRemote>(
      () => AuthRemoteImpl(injector()),
    );
    injector.registerLazySingleton<ChallengeRemote>(
      () => ChallengeRemoteImpl(injector()),
    );
  } catch (e) {
    dev.log('Config ServiceDependencies failed');
  }
}
