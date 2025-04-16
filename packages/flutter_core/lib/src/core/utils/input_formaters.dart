import 'package:flutter/services.dart';
import 'package:flutter_cors/flutter_core.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final double? min;
  final double? max;
  final bool canEmpty;

  CurrencyInputFormatter({
    this.min,
    this.max,
    this.canEmpty = false,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }
    if (newValue.text.trim().isEmpty) {
      if (canEmpty) {
        return newValue;
      }
      return newValue.copyWith(
          text: '0', selection: const TextSelection.collapsed(offset: 1));
    }

    final numberString = newValue.text.justNumber();
    double? value = double.tryParse(numberString);
    if (value == null) {
      return oldValue;
    }

    if (min != null && value < (min ?? 0.0)) {
      return oldValue;
    }

    if (max != null && value > (max ?? 0.0)) {
      return oldValue;
    }

    String newText = value.convertToCurrency();

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText =
    newValue.text.toNonVietnameseWithoutSpecials().toUpperCase();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
