import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'application/cubit/cubit.dart';
import 'configs/app_config.dart';
import 'constants/constants.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

// Alice alice = Alice(
//   navigatorKey: globalNavigatorKey,
//   showInspectorOnShake: true,
//   showNotification: false,
// );

Future<void> buidApp(Env env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppConfig().configApp(env: env);

  final authCubit = GetIt.I.get<AuthCubit>();
  await authCubit.initUserInfo();

  UIUtils.changeStatusBarColor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: alice.getNavigatorKey(),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate, // Add this line
      // ],
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
