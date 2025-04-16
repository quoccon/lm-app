import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../utils/utils.dart';
import 'constants.dart';

class AppIcon {
  AppIcon._();

  static Widget icon(
    String path, {
    double width = 20,
    double height = 20,
    Color? color,
  }) {
    return SvgPicture.asset(AssetsUrl.icon(path),
        width: width,
        height: height,
        colorFilter:
            ColorFilter.mode(color ?? IconColor.primary, BlendMode.srcIn));
  }

  static Widget size14(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 14, height: 14, color: color);
  }

  static Widget size16(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 16, height: 16, color: color);
  }

  static Widget size18(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 18, height: 18, color: color);
  }

  static Widget size20(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 20, height: 20, color: color);
  }

  static Widget size24(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 24, height: 24, color: color);
  }

  static Widget size28(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 28, height: 28, color: color);
  }

  static Widget size32(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 32, height: 32, color: color);
  }

  static Widget size56(
    String path, {
    Color? color,
  }) {
    return icon(path, width: 56, height: 56, color: color);
  }
}
