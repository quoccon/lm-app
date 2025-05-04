enum ChallengeStatusEnum {
  active,
  complete,
  fail,;

  int get value {
    switch (this) {
      case ChallengeStatusEnum.active:
        return 1;
      case ChallengeStatusEnum.complete:
        return 2;
      case ChallengeStatusEnum.fail:
        return 3;
    }
  }
}
