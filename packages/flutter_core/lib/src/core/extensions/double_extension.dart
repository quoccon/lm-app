import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String convertToNumberFormat() {
    var f = NumberFormat("###,###,###,###", "ja_JP");
    return f.format(this);
  }

  String convertToCurrency({String? locale}) {
    if (this == null) return '';
    return NumberFormat.currency(locale: locale ?? 'vi', symbol: '')
        .format(this)
        .trim();
  }
}
