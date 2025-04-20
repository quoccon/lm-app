import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class AppBgContainer extends StatelessWidget {
  const AppBgContainer({
    super.key,
    this.child,
    this.border,
    this.margin,
    this.padding,
    this.bgColor,
    this.radius,
    this.boxShadow,
    this.width,
    this.height,
  });

  final Border? border;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? bgColor;
  final BorderRadius? radius;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor ?? BackgroundColor.default1,
        borderRadius: radius ?? AppRadius.radius12,
        boxShadow: boxShadow,
        border: border,
      ),
      child: child,
    );
  }
}
