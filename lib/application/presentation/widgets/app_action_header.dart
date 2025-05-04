import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class AppActionHeader extends StatelessWidget {
  const AppActionHeader({
    super.key,
    this.title,
    this.action,
    this.actionTitle,
    this.icon,
  });

  final String? title;
  final String? actionTitle;
  final Function()? action;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title ?? "", style: AppTextStyle.medium.semibold)),
        if (action != null)
          TextButton.icon(
            onPressed: action,
            label: Text(actionTitle ?? "Sửa"),
            icon: AppIcon.size20(icon ?? 'ic_edit.svg', color: IconColor.brand),
          )
      ],
    );
  }
}
