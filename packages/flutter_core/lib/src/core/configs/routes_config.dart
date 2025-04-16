import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RoutesConfig {
  static final RoutesConfig _singleton = RoutesConfig._internal();

  factory RoutesConfig() {
    return _singleton;
  }

  RoutesConfig._internal();

  MaterialPageRoute routes(RouteSettings settings) {
    return routeWithName(settings: settings);
  }

  MaterialPageRoute routeWithName({
    String? routeName,
    RouteSettings? settings,
  }) {
    Widget widget;
    try {
      widget = GetIt.instance.get<Widget>(
        instanceName: routeName ?? settings?.name,
      );
    } catch (e) {
      widget = Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("")),
        body: const Center(child: Text("Không tìm thấy trang")),
      );
    }
    return MaterialPageRoute(
      builder: (BuildContext context) => widget,
      settings: settings,
    );
  }
}
