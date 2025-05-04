import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/presentation/widgets/widget.dart';

import '../../../constants/constants.dart';
import '../../datasource/model/model.dart';


class SingleSelectSheet {
  SingleSelectSheet._();

  static Future<void> show(
      BuildContext context, {
        String? title,
        required List<DropdownModel> items,
        DropdownModel? selectedItem,
        Function(DropdownModel)? onSelected,
        bool isAutoDismiss = true,
      }) async {
    UIUtils.showBottomSheet(context,
        child: _SingleSelectWidget(
          title: title,
          items: items,
          onSelected: onSelected,
          selectedItem: selectedItem,
          isAutoDismiss: isAutoDismiss,
        ));
  }
}

class _SingleSelectWidget extends StatelessWidget {
  const _SingleSelectWidget({
    this.title,
    required this.items,
    this.onSelected,
    this.selectedItem,
    this.isAutoDismiss = true,
  });
  final String? title;
  final List<DropdownModel> items;
  final DropdownModel? selectedItem;
  final Function(DropdownModel)? onSelected;
  final bool isAutoDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpaces.paddingPage),
      decoration: const BoxDecoration(
        color: BackgroundColor.default1,
        borderRadius: AppRadius.radiusTop32,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetHeader(title: title, showLine: false),
            Column(
              children: items
                  .map(
                    (e) => InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (isAutoDismiss) {
                      Navigator.of(context).pop();
                    }

                    onSelected?.call(e);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: AppSpaces.space6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.space16,
                      vertical: AppSpaces.space12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.radius8,
                      color: BackgroundColor.primary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(e.text,
                                style: AppTextStyle.regular.medium)),
                        AppIcon.size24(
                          e == selectedItem
                              ? 'ic_radio_checked.svg'
                              : 'ic_radio_uncheck.svg',
                          color: e == selectedItem
                              ? IconColor.brand
                              : IconColor.secondary,
                        )
                      ],
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
            AppSpaces.space8.vertical,
          ],
        ),
      ),
    );
  }
}
