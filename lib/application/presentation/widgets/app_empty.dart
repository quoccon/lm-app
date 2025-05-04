import 'package:flutter/material.dart';
import 'package:lifemap/constants/constants.dart';
import 'package:lottie/lottie.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/empty_animation.json',
            width: 100,
            height: 100,
          ),
          AppSpaces.space8.vertical,
          content,
        ],
      ),
    );
  }
}