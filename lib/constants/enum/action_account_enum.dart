import 'package:lifemap/constants/app_routes.dart';

enum ActionAccountEnum {
  info,
  challenge,
  achievements;

  String get icon {
    switch (this) {
      case ActionAccountEnum.info:
        return 'ic_person.svg';
      case ActionAccountEnum.challenge:
        return 'ic_challenge.svg';
      case ActionAccountEnum.achievements:
        return 'ic_achievements.svg';
    }
  }

  String get text {
    switch (this) {
      case ActionAccountEnum.info:
        return 'Thông tin';
      case ActionAccountEnum.challenge:
        return 'Thử thách';
      case ActionAccountEnum.achievements:
        return 'Thành tích';
    }
  }

  String get router {
    switch (this) {
      case ActionAccountEnum.info:
        return AppRoute.infoUser;
      case ActionAccountEnum.challenge:
        return AppRoute.challenge;
      case ActionAccountEnum.achievements:
        return AppRoute.achievements;
    }
  }
}
