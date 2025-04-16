import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  // static final inputBorder = OutlineInputBorder(
  //   borderSide: const BorderSide(color: BorderColor.brand),
  //   borderRadius: BorderRadius.circular(8.0),
  // );

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
      tabBarTheme: TabBarTheme(
        labelStyle: AppTextStyle.large.semibold,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: BorderColor.brand, width: 2),
        ),
        dividerColor: BorderColor.solid,
        tabAlignment: TabAlignment.start,
        unselectedLabelStyle:
        AppTextStyle.large.semibold.copyWith(color: TextColor.secondary),
        labelPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ) as TabBarThemeData,


      // unselectedWidgetColor: ColorConstants.subPrimary,
      // primarySwatch: ColorConstants.primaryColorSwatch,
      // primaryColor: ColorConstants.primary,
      // colorScheme: const ColorScheme.light(
      //     primary: ColorConstants.primary, secondary: ColorConstants.blue),
      // hintColor: ColorConstants.lightGrey,
      // iconTheme: const IconThemeData(
      //   color: ColorConstants.primary,
      // ),
      // textSelectionTheme: const TextSelectionThemeData(
      //   cursorColor: ColorConstants.primary,
      //   selectionColor: ColorConstants.subSecondary,
      //   selectionHandleColor: ColorConstants.subSecondary,
      // ),
      // radioTheme: RadioThemeData(
      //   fillColor:
      //       MaterialStateColor.resolveWith((states) => ColorConstants.blue),
      //   overlayColor: MaterialStateColor.resolveWith(
      //       (states) => ColorConstants.subPrimary),
      // ),
      // sliderTheme: const SliderThemeData(
      //   trackHeight: 6,
      //   thumbColor: ColorConstants.primary,
      //   activeTrackColor: ColorConstants.primary,
      //   inactiveTrackColor: ColorConstants.lightGrey,
      // ),
      // segmentedButtonTheme: SegmentedButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //         if (states.contains(MaterialState.selected)) {
      //           return ColorConstants.primary;
      //         }
      //         return ColorConstants.background;
      //       },
      //     ),
      //     side: MaterialStateProperty.resolveWith<BorderSide>(
      //       (Set<MaterialState> states) {
      //         return const BorderSide(
      //             width: 1, color: ColorConstants.background);
      //       },
      //     ),
      //     foregroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //         if (states.contains(MaterialState.selected)) {
      //           return ColorConstants.white;
      //         }
      //         return ColorConstants.primary;
      //       },
      //     ),
      //     textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      //       (Set<MaterialState> states) {
      //         return StyleConstants.textMediumMedium;
      //       },
      //     ),
      //   ),
      // ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     textStyle: StyleConstants.textMediumMedium.copyWith(
      //       decoration: TextDecoration.underline,
      //     ),
      //     backgroundColor: Colors.transparent,
      //     surfaceTintColor: Colors.transparent,
      //     foregroundColor: ColorConstants.primary,
      //     enableFeedback: true,
      //   ),
      // ),

      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //     padding: const EdgeInsets.all(12.0),
      //     elevation: 0.0,
      //     side: const BorderSide(
      //       color: ColorConstants.subPrimary,
      //     ),
      //     foregroundColor: ColorConstants.primary,
      //     textStyle: StyleConstants.textMediumMedium,
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(30),
      //       ),
      //     ),
      //   ),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     shadowColor: Colors.transparent,
      //     padding: const EdgeInsets.all(12.0),
      //     elevation: 0.0,
      //     foregroundColor: ColorConstants.white,
      //     backgroundColor: ColorConstants.primary,
      //     disabledBackgroundColor: ColorConstants.lightGrey,
      //     splashFactory: InkRipple.splashFactory,
      //     textStyle: StyleConstants.textMediumMedium,
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(30),
      //       ),
      //     ),
      //   ),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //   checkColor: MaterialStateProperty.all(ColorConstants.white),
      //   side: const BorderSide(
      //     color: ColorConstants.primary,
      //     width: 1,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(2),
      //   ),
      //   fillColor: MaterialStateProperty.all(ColorConstants.primary),
      // ),
    );
  }
}
