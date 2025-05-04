import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/utils.dart';

class ImagePickItem extends StatelessWidget {
  const ImagePickItem({
    super.key,
    required this.icon,
    required this.title,
    this.onPress,
  });

  final String icon;
  final String title;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onPress,
        child: Container(
          height: 141,
          decoration: BoxDecoration(
            color: BackgroundColor.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcon.size32(icon,color: IconColor.brand),
              AppSpaces.space16.vertical,
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.regular,
              )
            ],
          ),
        ),
      ),
    );
  }
}
