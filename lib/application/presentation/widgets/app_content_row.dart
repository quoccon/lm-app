import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../../constants/constants.dart';

class AppContentRow extends StatelessWidget {
  const AppContentRow({
    super.key,
    this.label,
    this.contentWidget,
    this.text,
    this.isShowBottomDash = true,
  });

  final String? label;
  final Widget? contentWidget;
  final String? text;
  final bool isShowBottomDash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpaces.space12.vertical,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? '',
              style: AppTextStyle.regular.copyWith(color: TextColor.secondary),
            ),
            AppSpaces.space8.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  text.isEmptyOrNull
                      ? contentWidget ?? const SizedBox()
                      : Text(
                          text ?? '',
                          style: AppTextStyle.regular,
                          textAlign: TextAlign.right,
                        )
                ],
              ),
            )
          ],
        ),
        AppSpaces.space12.vertical,
        if (isShowBottomDash) const DottedLine(dashColor: BorderColor.dash),
      ],
    );
  }
}
