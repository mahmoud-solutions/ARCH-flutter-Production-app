import 'package:arch_team_power/core/models/settings_item_model.dart';
import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class SettingsItemsData {
  static List<SettingsItemModel> items(BuildContext context) => [
    SettingsItemModel(
      pageRoute: AppRouter.kUpdateProfileScreen,
      title: "تعديل الملف الشخصي",
      iconPath: AppIcons.kEditProfileIcon,
    ),
    SettingsItemModel(title: "تغيير اللغه", iconPath: AppIcons.kLangIcon),
    SettingsItemModel(title: "وسائل الدفع", iconPath: AppIcons.kPaymentIcon),
    SettingsItemModel(title: "الخصوصية", iconPath: AppIcons.kPrivacyIcon),
    SettingsItemModel(title: "الدعم", iconPath: AppIcons.kContactIcon),
    SettingsItemModel(
      title: "الخروج من الحساب",
      iconPath: AppIcons.kLogOutIcon,
      isLogout: true,
    ),
  ];
}
