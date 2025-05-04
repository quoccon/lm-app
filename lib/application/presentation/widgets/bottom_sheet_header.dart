import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import 'app_line.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
    this.title,
    this.showLine = true,
    this.child,
  });

  final String? title;
  final bool showLine;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              child: AppIcon.size28(
                'ic_close.svg',
                color: IconColor.secondary,
              ),
            ),
            AppSpaces.space12.horizontal,
            Expanded(
                child: child ??
                    Text(
                      title ?? '',
                      style: AppTextStyle.headingSmall.semibold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
          ],
        ),
        AppSpaces.space16.vertical,
        if (showLine) const AppLine(),
      ],
    );
  }
}
