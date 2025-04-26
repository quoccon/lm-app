import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';

import '../application/cubit/cubit.dart';


Future<void> config(GetIt injector) async {
  try {
    injector.registerSingleton<AuthCubit>(AuthCubit());
    injector.registerSingleton<LoginCubit>(LoginCubit(injector(),injector()));
    injector.registerSingleton<MainTabCubit>(MainTabCubit());
    injector.registerSingleton<RegisterCubit>(RegisterCubit(injector()));
    injector.registerFactory<HomeCubit>(() => HomeCubit());
    injector.registerFactory<ChatCubit>(() => ChatCubit());
    injector.registerFactory<NotiCubit>(() => NotiCubit());
    injector.registerFactory<AccountCubit>(() => AccountCubit());
  } catch (e) {
    dev.log('DI initialization failed: $e', error: e);
  }
}
