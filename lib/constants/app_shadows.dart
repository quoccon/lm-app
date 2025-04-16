import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();

  static final ds1 = BoxShadow(
    color: const Color(0xFF00103D).withOpacity(0.10),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 0),
  );

  static final ds2 = BoxShadow(
    color: const Color(0xFF00103D).withOpacity(0.16),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 1),
  );

  static final ds3 = BoxShadow(
    color: const Color(0xFF00103D).withOpacity(0.20),
    spreadRadius: 0,
    blurRadius: 12,
    offset: const Offset(0, 4),
  );

  static final ds4 = BoxShadow(
    color: const Color(0xFF00103D).withOpacity(0.26),
    spreadRadius: 5,
    blurRadius: 24,
    offset: const Offset(0, 10),
  );
}
