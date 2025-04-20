import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AppTabbar extends StatelessWidget {
  const AppTabbar({
    super.key,
    this.isTab = false,
    this.controller,
    this.dividerHeight,
    required this.tabs,
    this.padding,
  });
  final bool isTab;
  final TabController? controller;
  final double? dividerHeight;
  final List<Widget> tabs;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabAlignment: TabAlignment.start,
        controller: controller,
        isScrollable: true,
        dividerHeight: dividerHeight,
        indicatorSize: isTab ? TabBarIndicatorSize.tab : null,
        indicator: isTab
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: BorderColor.solid,
              )
            : null,
        padding: padding,
        tabs: tabs,
        labelPadding: isTab
            ? const EdgeInsets.symmetric(horizontal: 12.0)
            : const EdgeInsets.only(right: 24.0));
  }
}
