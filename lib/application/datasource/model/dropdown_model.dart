import 'package:flutter_cors/flutter_core.dart';

class DropdownModel extends Equatable {
  final dynamic key;
  final String text;
  final String? icon;
  final String? subText;
  final String? displayText;
  final dynamic data;

  const DropdownModel({
    required this.key,
    required this.text,
    this.icon,
    this.subText,
    this.displayText,
    this.data,
  });

  @override
  List<Object?> get props => [
    key,
    text,
    icon,
    subText,
    displayText,
    data,
  ];
}
