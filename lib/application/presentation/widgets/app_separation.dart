import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import 'app_line.dart';

class Separation extends StatelessWidget {
  const Separation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppLine(
      height: 8,
      color: BackgroundColor.primary,
    );
  }
}
