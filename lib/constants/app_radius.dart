import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();
  static final radius4 = BorderRadius.circular(4.0);
  static final radius8 = BorderRadius.circular(8.0);
  static final radius12 = BorderRadius.circular(12.0);
  static final radius16 = BorderRadius.circular(16.0);
  static final radius32 = BorderRadius.circular(32.0);
  static const radiusTop16 = BorderRadius.only(
      topLeft: Radius.circular(16), topRight: Radius.circular(16));
  static const radiusTop32 = BorderRadius.only(
      topLeft: Radius.circular(32), topRight: Radius.circular(32));
}
