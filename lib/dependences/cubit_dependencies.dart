import 'dart:developer' as dev;
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/add_challenge/add_challenge_cubit.dart';

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
    injector.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit());
    injector.registerFactory<InfoUserCubit>(() => InfoUserCubit());
    injector.registerFactory<ChallengeCubit>(() => ChallengeCubit(injector()));
    injector.registerFactory<AchievementsCubit>(() => AchievementsCubit());
    injector.registerFactory<SuggestionCubit>(() => SuggestionCubit(injector()));
    injector.registerFactory<AddChallengeCubit>(() => AddChallengeCubit(injector(),injector()));
  } catch (e) {
    dev.log('DI initialization failed: $e', error: e);
  }
}
