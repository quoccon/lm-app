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
      tabAlignment: TabAlignment.fill,
      controller: controller,
      isScrollable: false,
      dividerHeight: dividerHeight,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: isTab
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: BorderColor.solid,
      )
          : null,
      padding: padding,
      tabs: tabs,
      labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      labelStyle: const TextStyle(fontSize: 16),
    );
  }
}