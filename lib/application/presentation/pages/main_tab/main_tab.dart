import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/cubit.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      UIUtils.showTopSnackbar(
        context,
        message: 'Back thêm 1 nữa để thoát app',
        type: SnackBarType.warning,
      );
      return Future.value(false);
    }
    currentBackPressTime = null;
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainTabCubit>(
      padding: EdgeInsets.zero,
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: MainTabPages(),
      ),
      bottomAppBar: BottomBarWidget(),
    );
  }
}

class MainTabPages extends StatefulWidget {
  const MainTabPages({super.key});

  @override
  State<MainTabPages> createState() => _MainTabPagesState();
}

class _MainTabPagesState extends State<MainTabPages> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
