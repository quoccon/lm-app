import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get shortDisplay {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

extension DateTimeNullExtensions on DateTime? {
  String? get ymdDisplay {
    if (this == null) {
      return null;
    }
    return DateFormat('yyyy/MM/dd').format(this!);
  }
}
