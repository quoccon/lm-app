import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  Color strToColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }

  String toNonVietnameseWithoutSpecials() {
    const withDia =
        'áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđ';
    const withoutDia =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd';
    final str = toLowerCase();
    final output = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final index = withDia.indexOf(str[i]);
      if (index != -1) {
        if (index < withoutDia.length) {
          output.write(withoutDia[index]);
        }
      } else if (RegExp(r'[a-zA-Z0-9\s]').hasMatch(str[i])) {
        output.write(str[i]);
      }
    }
    return output.toString();
  }

  String justNumber() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  String toStandardVietnamStandardPhone() {
    String input = replaceAll('+84', '0');
    if (input.startsWith('84')) {
      input = input.replaceFirst('84', '0');
    }
    return input;
  }

  DateTime? toDateTime() {
    return DateTime.tryParse(this);
  }

  String? get shortDisplayCreatedAt {
    if (isEmpty) return null;
    final date = (this).toDateTime()?.add(const Duration(hours: 7));
    if (date == null) {
      return null;
    }
    final now = DateTime.now();
    if (date.day != now.day ||
        date.month != now.month ||
        date.year != now.year) {
      return DateFormat('dd/MM/yyyy').format(date);
    }
    return DateFormat('HH:mm').format(date);
  }
}

extension StringNullSafe on String? {
  bool get isEmptyOrNull => (this ?? '').trim().isEmpty;
  bool get isNotEmptyOrNull => (this ?? '').trim().isNotEmpty;
  String get value => this ?? '';

  double? get toDoubleRate {
    double? _doubleRate = this == null ? null : double.tryParse(this!);

    double? doubleRate = _doubleRate == null
        ? null
        : double.tryParse(_doubleRate.toStringAsFixed(1));
    return doubleRate;
  }
}
