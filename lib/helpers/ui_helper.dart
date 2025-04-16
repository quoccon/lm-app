import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../app.dart';
import '../constants/constants.dart';

class UIHelper {
  UIHelper._();

  static void goLogin(BuildContext? context) {
    final _context = context ?? globalNavigatorKey.currentContext;
    if (_context == null) {
      return;
    }
    UIUtils.hideKeyboard();
    Navigator.of(_context)
        .pushNamedAndRemoveUntil(AppRoute.login, (route) => false);
  }

  static Future<void> showAppDialog(
      BuildContext context, {
        String? title,
        String? description,
        bool barrierDismissible = true,
        void Function()? onPressMainButton,
        String? mainButtonTitle,
        void Function()? onPressSubButton,
        String? subButtonTitle,
        Color? mainButtonColor,
        Color? subButtonColor,
      }) {
    UIUtils.hideKeyboard();
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BackgroundColor.default1,
          title: title == null ? null : Text(title),
          content: description == null ? null : Text(description),
          titleTextStyle: AppTextStyle.headingSmall.semibold,
          titlePadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 8),
          actionsPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 8,
            top: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.radius16,
          ),
          contentTextStyle: AppTextStyle.regular.copyWith(
            color: TextColor.secondary,
          ),
          actions: <Widget>[
            if (onPressSubButton != null)
              TextButton(
                child: Text(subButtonTitle ?? 'Đóng',
                    style: AppTextStyle.large.semibold.copyWith(
                      color: subButtonColor ?? TextColor.brand,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressSubButton.call();
                },
              ),
            if (onPressMainButton != null)
              TextButton(
                child: Text(
                  mainButtonTitle ?? 'Đồng ý',
                  style: AppTextStyle.large.semibold.copyWith(
                    color: mainButtonColor ?? TextColor.brand,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  onPressMainButton.call();
                },
              ),
          ],
        );
      },
    );
  }
}
