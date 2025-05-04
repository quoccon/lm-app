import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    super.key,
    this.child,
    this.padding,
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppSpaces.paddingPage),
      child: child,
    );
  }
}
