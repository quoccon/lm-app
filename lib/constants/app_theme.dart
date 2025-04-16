import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get(BuildContext context) {
    return ThemeData(
      fontFamily: 'SVN-Poppins',
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: TextColor.primary,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: BackgroundColor.default1,
        titleTextStyle: AppTextStyle.headingSmall.semibold,
        surfaceTintColor: BackgroundColor.default1,
        iconTheme: const IconThemeData(
          color: IconColor.secondary,
          size: 28,
        ),
        actionsIconTheme: const IconThemeData(
          color: IconColor.brand,
          size: 28,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AppTextStyle.regular.semibold,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: TextColor.brand,
          iconColor: IconColor.brand,
          enableFeedback: true,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.all(11.0),
          elevation: 0.0,
          foregroundColor: TextColor.inverse,
          backgroundColor: BackgroundColor.brandPrimary,
          disabledBackgroundColor: BackgroundColor.disabled,
          disabledForegroundColor: TextColor.inverse,
          splashFactory: InkRipple.splashFactory,
          textStyle: AppTextStyle.large.semibold,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextStyle.regular.copyWith(color: TextColor.tertiary),
        hintStyle: AppTextStyle.regular.copyWith(color: TextColor.tertiary),
        isDense: true,
        contentPadding:
        const EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 4),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      tabBarTheme: TabBarThemeData( // Sử dụng TabBarThemeData thay vì TabBarTheme
        labelStyle: AppTextStyle.large.semibold,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: BorderColor.brand, width: 2),
        ),
        dividerColor: BorderColor.solid,
        tabAlignment: TabAlignment.start,
        unselectedLabelStyle: AppTextStyle.large.semibold.copyWith(color: TextColor.secondary),
        labelPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
    );
  }
}
