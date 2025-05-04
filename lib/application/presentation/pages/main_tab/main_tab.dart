import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../../constants/constants.dart';
import '../../../cubit/main_tab/main_tab_cubit.dart';
import '../pages.dart';

class MainTabs extends StatefulWidget {
  const MainTabs({super.key});

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  final PageController _controller = PageController();
  DateTime? currentBackPressTime;

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      UIUtils.showTopSnackbar(context,
          message: 'Back thêm 1 nữa để thoát app', type: SnackBarType.warning);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainTabCubit>(
      padding: EdgeInsets.zero,
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: _MainPagesListener(controller: _controller),
      ),
      onInit: (cubit) {
        log('MAIN INIT');
      },
      bottomAppBar: const _Tabs(),
      onLoadData: (bloc) async {},
    );
  }
}

class _MainPagesListener extends StatelessWidget {
  final PageController controller;

  const _MainPagesListener({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainTabCubit, MainTabState>(
      listener: (context, state) {
        controller.jumpToPage(state.selectItem);
        UIUtils.hideKeyboard();
      },
      child: _MainPages(controller: controller),
    );
  }
}

class _MainPages extends StatelessWidget {
  final PageController controller;

  const _MainPages({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        ChatPage(),
        NotiPage(),
        AccountPage(),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTabCubit, MainTabState>(
      buildWhen: (previous, current) =>
      previous.selectItem != current.selectItem,
      builder: (context, state) {
        final tabsBloc = context.read<MainTabCubit>();

        return BottomAppBar(
          surfaceTintColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          height: 62,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 1, color: BorderColor.solid),
              AppSpaces.space4.vertical,
              Row(
                children: state.itemTab.map((e) {
                  final isSelected = e.index == state.selectItem;

                  return Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: BackgroundColor.default1,
                      onTap: () {
                        tabsBloc.selected(e.index);
                      },
                      child: _buildItem(e, isSelected),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(TabBarItem e, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpaces.space8.vertical,
        AppIcon.size24(
          e.icon,
          color: isSelected ? IconColor.primary : IconColor.secondary,
        ),
        AppSpaces.space2.vertical,
        Text(
          e.title,
          maxLines: 1,
          textScaler: TextScaler.noScaling,
          style: AppTextStyle.xSmall.medium.copyWith(
            color: isSelected ? TextColor.primary : TextColor.secondary,
          ),
        ),
      ],
    );
  }
}
