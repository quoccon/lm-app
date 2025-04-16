import 'package:flutter/material.dart';

extension WithSpace on double {
  SizedBox get vertical => SizedBox(height: this);
  SizedBox get horizontal => SizedBox(width: this);
}

class AppSpaces {
  AppSpaces._();
  static const space2 = 2.0;
  static const space4 = 4.0;
  static const space6 = 6.0;
  static const space8 = 8.0;
  static const space12 = 12.0;
  static const space16 = 16.0;
  static const space20 = 20.0;
  static const space24 = 24.0;
  static const space28 = 28.0;
  static const space32 = 32.0;
  static const space40 = 40.0;
  static const space48 = 48.0;
  static const space96 = 96.0;
  static const paddingPage = 16.0;
}
