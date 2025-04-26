import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
    this.isEnable = true,
  });

  final List<T> items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? hint;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnable,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius8,
          border: Border.all(color: BorderColor.solid),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            icon: AppIcon.size24(
              'ic_narrow_down.svg',
              color: IconColor.primary,
            ),
            hint: Text(
              hint ?? '',
              style: AppTextStyle.regular.copyWith(color: TextColor.tertiary),
            ),
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item is GenderEnum ? item.genderString : item.toString(),
                  style: AppTextStyle.regular.copyWith(
                    color: TextColor.primary,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

