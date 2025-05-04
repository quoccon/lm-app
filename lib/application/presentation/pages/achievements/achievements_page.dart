import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../cubit/cubit.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<AchievementsCubit>(
      body: AchievementsBody(),
      title: const Text("Thành tích cá nhân"),
    );
  }
}

class AchievementsBody extends StatefulWidget {
  const AchievementsBody({super.key});

  @override
  State<AchievementsBody> createState() => _AchievementsBodyState();
}

class _AchievementsBodyState extends State<AchievementsBody> {
  @override
  Widget build(BuildContext context) {
    return Text("achievements");
  }
}
