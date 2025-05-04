import 'package:lifemap/constants/app_routes.dart';

enum OtherActionEnum {
  contact,
  privacy,
  setting,;

  String get icon {
    switch (this) {
      case OtherActionEnum.contact:
        return 'ic_contact.svg';
      case OtherActionEnum.privacy:
        return 'ic_privacy.svg';
      case OtherActionEnum.setting:
        return 'ic_setting.svg';
    }
  }

  String get title {
    switch (this) {
      case OtherActionEnum.contact:
        return 'Liên hệ chúng tôi';
      case OtherActionEnum.privacy:
        return 'Chính sách & bảo mật';
      case OtherActionEnum.setting:
        return 'Cài đặt';
    }
  }

  String get router {
    switch (this) {
      case OtherActionEnum.contact:
        return AppRoute.contact;
      case OtherActionEnum.privacy:
        return AppRoute.privacy;
      case OtherActionEnum.setting:
        return AppRoute.setting;
    }
  }
}