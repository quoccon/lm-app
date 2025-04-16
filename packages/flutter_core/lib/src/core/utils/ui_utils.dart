import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum SnackBarType { info, warning, success }

class UIUtils {
  UIUtils._();

  static void showLoading({String? title}) {
    hideKeyboard();
    if (!EasyLoading.isShow) {
      EasyLoading.show(status: title);
    }
  }

  static void hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  static void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static void showTopSnackbar(
      BuildContext context, {
        String? message,
        SnackBarType type = SnackBarType.success,
        Widget? infoWidget,
        Duration? displayDuration,
        bool persistent = false,
      }) {
    hideKeyboard();
    showTopSnackBar(
        Overlay.of(context),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(8)),
          child: infoWidget ??
              Row(
                children: [
                  SvgPicture.asset(
                      'assets/icons/${type == SnackBarType.success ? 'ic_success.svg' : 'ic_failed.svg'}',
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                          type == SnackBarType.success
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          BlendMode.srcIn)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message ?? '',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
        ),
        persistent: persistent,
        curve: Curves.ease,
        reverseCurve: Curves.ease,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
        animationDuration: const Duration(milliseconds: 400),
        reverseAnimationDuration: const Duration(milliseconds: 400),
        displayDuration: displayDuration ?? const Duration(milliseconds: 1200));
  }

  static void showBottomSheet(
      BuildContext context, {
        required Widget child,
        Color? backgroundColor,
        Color? barrierColor,
        bool enableDrag = true,
        bool isFixFull = false,
      }) {
    hideKeyboard();
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        expand: isFixFull,
        enableDrag: enableDrag,
        closeProgressThreshold: 0.45,
        duration: const Duration(milliseconds: 300),
        barrierColor: barrierColor,
        builder: (BuildContext context) {
          return SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: child,
              ));
        });
  }
}
