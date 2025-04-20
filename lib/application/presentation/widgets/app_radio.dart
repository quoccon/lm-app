import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AppRadio extends StatelessWidget {
  const AppRadio({
    super.key,
    this.isChecked = false,
    this.text,
    this.onTap,
  });

  final bool isChecked;
  final String? text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onTap?.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon.size32(
            isChecked ? 'ic_radio_checked.svg' : 'ic_radio_uncheck.svg',
            color: isChecked ? IconColor.brand : IconColor.teritary,
          ),
          if (text != null) ...[
            AppSpaces.space8.horizontal,
            Expanded(child: Text(text ?? '', style: AppTextStyle.eSmall))
          ],
        ],
      ),
    );
  }
}
