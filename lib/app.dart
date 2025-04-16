import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'application/cubit/cubit.dart';
import 'configs/app_config.dart';
import 'constants/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

Future<void> buidApp(Env env) async {
  print('rnv: $env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppConfig().configApp(env: env);

  final authCubit = GetIt.I.get<AuthCubit>();
  await authCubit.initUserInfo();

  UIUtils.changeStatusBarColor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Add this line
      ],
      supportedLocales: const [Locale('vi', 'VN')],
      locale: const Locale('vi', 'VN'),
      navigatorKey: globalNavigatorKey,
      title: 'SoundBox BD',
      theme: AppTheme.get(context),
      onGenerateRoute: RoutesConfig().routes,
      onGenerateInitialRoutes: (_) => [
        RoutesConfig().routeWithName(
            routeName:
            authCubit.state.isLogined ? AppRoute.mainTab : AppRoute.login),
      ],
      builder: EasyLoading.init(),
    );
  }
}