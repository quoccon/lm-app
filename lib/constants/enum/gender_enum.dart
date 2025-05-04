enum GenderEnum {
  male,
  female;

  String get genderString{
    switch (this){
      case GenderEnum.male:
        return 'Nam';
      case GenderEnum.female:
        return 'Nữ';
    }
  }
}