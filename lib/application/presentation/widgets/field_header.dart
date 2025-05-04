import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class FieldHeader extends StatelessWidget {
  const FieldHeader(
      this.text, {
        super.key,
        this.top = 24,
        this.bottom = 6,
        this.isRequired = false,
      });

  final String text;
  final double top;
  final double bottom;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: AppTextStyle.regular.medium,
            ),
            if (isRequired)
              TextSpan(
                text: ' *',
                style: AppTextStyle.regular.medium.copyWith(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
