extension IntExtension on int? {
  String get numOrDash {
    if ((this ?? 0) == 0) {
      return '-';
    }
    return '$this';
  }
}
