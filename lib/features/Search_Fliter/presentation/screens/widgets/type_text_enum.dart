enum TypeTextEnum { diniya, tarikhia, zakharef, romooz, she3arat }

extension TypeTextEnumExtension on TypeTextEnum {
  String get label {
    switch (this) {
      case TypeTextEnum.diniya:
        return 'دينيه';
      case TypeTextEnum.tarikhia:
        return 'تاريخيه';
      case TypeTextEnum.zakharef:
        return 'زخارف';
      case TypeTextEnum.romooz:
        return 'رموز';
      case TypeTextEnum.she3arat:
        return 'شعارات';
    }
  }
}
