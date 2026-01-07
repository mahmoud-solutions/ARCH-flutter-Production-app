import 'dart:ui';

class SettingsItemModel {
  final String title;
  final String iconPath;
  final bool isLogout;
  final String? pageRoute;

  SettingsItemModel({
    required this.title,
    required this.iconPath,
    this.isLogout = false,
    this.pageRoute,
  });
}
