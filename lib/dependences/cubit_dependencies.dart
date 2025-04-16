import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';

import '../application/cubit/cubit.dart';


Future<void> config(GetIt injector) async {
  try {
    injector.registerSingleton<AuthCubit>(AuthCubit());
    injector.registerSingleton<LoginCubit>(LoginCubit());
    injector.registerSingleton<MainTabCubit>(MainTabCubit());
  } catch (e) {
    dev.log('DI initialization failed: $e', error: e);
  }
}
