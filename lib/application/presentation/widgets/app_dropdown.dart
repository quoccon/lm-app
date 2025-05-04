import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.onTap,
    this.hint,
    this.text,
    this.isEnable = true,
  });

  final VoidCallback? onTap;
  final String? text;
  final String? hint;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: isEnable ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius8,
          border: Border.all(color: BorderColor.solid),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text ?? hint ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.regular.copyWith(
                  color: text == null || !isEnable
                      ? TextColor.tertiary
                      : TextColor.primary,
                ),
              ),
            ),
            AppIcon.size24(
              'ic_narrow_down.svg',
              color: IconColor.primary,
            )
          ],
        ),
      ),
    );
  }
}
