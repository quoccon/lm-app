import 'dart:developer';

import 'package:lifemap/application/presentation/pages/chat/chat_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../../constants/constants.dart';
import '../../../../helpers/helpers.dart';
import '../../../cubit/main_tab/main_tab_cubit.dart';
import '../account/account_page.dart';
import '../home/home_page.dart';

class MainTabs extends StatefulWidget {
  const MainTabs({super.key});

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
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
    currentBackPressTime = null;
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainTabCubit>(
      padding: EdgeInsets.zero,
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: const _MainPagesListener(),
      ),
      onInit: (cubit) {
        log('MAIN INIT');
        // AppInfo().setFirebaseToken();
        // cubit?.getBiometricSuggestionStatus();
        // cubit?.registerListeners();
      },
      onDispose: (cubit) {
        // cubit?.dispose();
      },
      bottomAppBar: const _Tabs(),
      // floatingActionButton: const _FloatButton(),
      onLoadData: (bloc) async {},
    );
  }
}

class _MainPagesListener extends StatelessWidget {
  const _MainPagesListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainTabCubit, MainTabState>(
      listener: (context, state) {
        // if (state.showRequestBiometric == false) {
        //   showBiometricSuggestion(context);
        // }
      },
      child: const _MainPages(),
    );
  }

  // void showBiometricSuggestion(BuildContext context) async {
  //   // final type = await BiometricHelper().getBiometricType();
  //   if (!context.mounted) return;
  //   UIUtils.showBottomSheet(context,
  //       child: BiometricSuggestion(
  //         onPressMainBtn: () {
  //           context
  //               .read<MainTabCubit>()
  //               .biometricAuthenticate()
  //               .onError((_, __) {
  //             UIUtils.showTopSnackbar(context,
  //                 message: 'Cài đặt sinh trắc học không thành công',
  //                 type: SnackBarType.warning);
  //             return null;
  //           }).then((value) {
  //             if (value ?? false) {
  //               UIUtils.showTopSnackbar(context,
  //                   message: 'Cài đặt sinh trắc học thành công!',
  //                   type: SnackBarType.success);
  //             }
  //           });
  //         },
  //         type: type,
  //       ));
  // }
}
//
// class _FloatButton extends StatelessWidget {
//   const _FloatButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: const Offset(0, 10),
//       child: SizedBox(
//         width: 63,
//         height: 63,
//         child: FittedBox(
//           child: FloatingActionButton(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.transparent,
//             shape: const CircleBorder(),
//             elevation: 0.0,
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 AppRoute.qrManager,
//               );
//             },
//             child: Image.asset(
//               AssetsUrl.image('ic_qr_tabbar.png'),
//               width: 48,
//               height: 48,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _MainPages extends StatelessWidget {
  const _MainPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return BlocListener<MainTabCubit, MainTabState>(
      listenWhen: (previous, current) =>
      previous.selectItem != current.selectItem,
      listener: (context, state) {
        controller.jumpToPage(state.selectItem);
        UIUtils.hideKeyboard();
      },
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          HomePage(),
          ChatPage(),
          Center(child: Text("Report")),
          AccountPage(),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    super.key,
  });

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
                            if (e.index == -1) {
                              // Todo: go to create page.
                              return;
                            }
                            tabsBloc.selected(e.index);
                          },
                          child: _buildItem(e, isSelected)));
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
        Text(e.title,
            maxLines: 1,
            textScaler: TextScaler.noScaling,
            style: AppTextStyle.xSmall.medium.copyWith(
              color: isSelected ? TextColor.primary : TextColor.secondary,
            )),
      ],
    );
  }
}
