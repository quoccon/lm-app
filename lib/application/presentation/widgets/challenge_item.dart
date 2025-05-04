import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lifemap/application/datasource/model/challenge_model.dart';
import 'package:lifemap/application/presentation/widgets/app_bg_container.dart';
import 'package:lifemap/constants/app_colors.dart';
import 'package:lifemap/constants/app_spaces.dart';

class ChallengeItem extends StatelessWidget {
  const ChallengeItem({super.key, this.item});

  final ChallengeModel? item;

  @override
  Widget build(BuildContext context) {
    return AppBgContainer(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      border: Border.all(width: 1,color: TextColor.gray),
      bgColor: BackgroundColor.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item?.challengeName ?? ''),
              Text("${item?.participants?.length} thành viên"),
            ],
          ),
          AppSpaces.space8.vertical,
          DottedLine()

        ],
      ),
    );
  }
}
