import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AppLine extends StatelessWidget {
  const AppLine({
    super.key,
    this.color = BorderColor.solid,
    this.height = 1,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}
