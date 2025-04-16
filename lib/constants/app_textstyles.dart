import 'package:flutter/material.dart';

import 'constants.dart';

class AppTextStyle {
  AppTextStyle._();

  static const _primaryStyle = TextStyle(
    color: TextColor.primary,
    fontFamily: 'SVN-Poppins',
  );

  static final xSmall = _primaryStyle.copyWith(
      fontSize: 11, fontWeight: FontWeight.normal, height: 16 / 11);
  static final small = _primaryStyle.copyWith(
      fontSize: 12, fontWeight: FontWeight.normal, height: 16 / 12);
  static final eSmall = _primaryStyle.copyWith(
      fontSize: 13, fontWeight: FontWeight.normal, height: 18 / 13);
  static final regular = _primaryStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.normal, height: 20 / 14);
  static final medium = _primaryStyle.copyWith(
      fontSize: 15, fontWeight: FontWeight.normal, height: 20 / 15);
  static final large = _primaryStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.normal, height: 22 / 16);
  static final headingSmall = _primaryStyle.copyWith(
      fontSize: 18, fontWeight: FontWeight.normal, height: 22 / 18);
  static final heading = _primaryStyle.copyWith(
      fontSize: 20, fontWeight: FontWeight.normal, height: 24 / 20);
  static final text24 = _primaryStyle.copyWith(
      fontSize: 24, fontWeight: FontWeight.normal, height: 32 / 24);
  static final text28 = _primaryStyle.copyWith(
      fontSize: 28, fontWeight: FontWeight.normal, height: 36 / 28);
}

extension WithFontWeight on TextStyle {
  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.bold);
  }
}
