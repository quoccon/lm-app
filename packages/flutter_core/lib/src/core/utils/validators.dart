import 'package:intl/intl.dart';
import 'package:flutter_cors/flutter_core.dart';

class Validator {
  Validator._();

  static bool isOnlyNumber(String? text) {
    if (text.isEmptyOrNull) {
      return false;
    }
    return RegExp(r"^\d+$").hasMatch(text ?? '');
  }

  static bool isOnlyEngCharAndNumber(String? text) {
    if (text.isEmptyOrNull) {
      return false;
    }
    return RegExp(r"^[a-zA-Z0-9]*$").hasMatch(text ?? '');
  }

  static String? validVietnamesePhone(String? text,
      {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();

    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Số điện thoại không được để trống";
      }
    }
    final phone = (trimText ?? '').toStandardVietnamStandardPhone().trim();
    // final isValid = RegExp(r"(02|03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b")
    //         .hasMatch(phone) &&
    //     phone.length == 10;
    // final phone = input?.trim();
    if (!isOnlyNumber(phone)) {
      return "Số điện thoại không hợp lệ";
    }
    final isValid = (phone.startsWith('0')) && phone.length == 10;
    if (!isValid) {
      return "Số điện thoại không hợp lệ";
    }
    return null;
  }

  static String? validEmail(String? text, {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();

    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Email không được để trống";
      }
    }

    final isValid =
    RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(trimText ?? '');

    if (!isValid) {
      return "Email không hợp lệ";
    }
    return null;
  }

  static String? validName(String? text, {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Họ và tên không được để trống";
      }
    }
    return null;
  }

  static String? validIdentity(String? text, {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();

    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Số CCCD không được để trống";
      }
    }
    final identity = trimText ?? '';

    if (!isOnlyNumber(identity) || identity.length > 12) {
      return "Số CCCD không hợp lệ";
    }
    return null;
  }

  static String? validBankNumber(String? text, {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Số tài khoản không được để trống";
      }
    }
    if (!isOnlyEngCharAndNumber(trimText)) {
      return "Số tài khoản không hợp lệ";
    }
    return null;
  }

  static String? validNote(String? text, {bool canEmptyOrNull = false}) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      if (canEmptyOrNull) {
        return null;
      } else {
        return "Ghi chú không được để trống";
      }
    }
    if ((trimText ?? '').length > 1000) {
      return "Ghi chú quá dài";
    }
    return null;
  }

  static String? validStoreName(String? text) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      return "Tên cửa hàng không được để trống";
    }
    if ((trimText ?? '').length > 50) {
      return "Tên cửa hàng quá dài";
    }
    return null;
  }

  static String? validVAName(String? text) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      return "Tên VA không được để trống";
    }
    if ((trimText ?? '').length > 50) {
      return "Tên VA quá dài";
    }
    return null;
  }

  static String? validDetailAddress(String? text) {
    final trimText = text?.trim();
    if (trimText.isEmptyOrNull) {
      return "Địa chỉ chi tiết không được để trống";
    }
    // if ((trimText ?? '').length < 6) {
    //   return "Tối thiểu có 6 ký tự";
    // }
    if ((trimText ?? '').length > 500) {
      return "Địa chỉ chi tiết không được vượt quá 500 ký tự";
    }
    return null;
  }

  static bool validDate(
      String? input, {
        DateTime? minDate,
        DateTime? maxDate,
        String format = 'dd/MM/yyyy',
      }) {
    if (input == null) return false;
    minDate ??= DateTime(1800, 01, 01);
    maxDate ??= DateTime(3000, 01, 01);
    try {
      var date = DateFormat(format).parseStrict(input);
      if (date.isBefore(minDate) || date.isAfter(maxDate)) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
