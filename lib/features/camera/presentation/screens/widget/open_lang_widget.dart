import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/language_bottom_sheet.dart';
import 'package:flutter/material.dart';

class LanguageOption {
  final String code;
  final String name;
  final String flag;

  LanguageOption({required this.code, required this.name, required this.flag});
}

class OpenLangWidget extends StatelessWidget {
  const OpenLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageBottomSheet(
      initialLang: 'en',
      languages: [
        LanguageOption(
          code: 'en',
          name: 'English',
          flag: AppIcons.kEnglishLangFlage,
        ),
        LanguageOption(
          code: 'ar',
          name: 'Arabic',
          flag: AppIcons.kArbicLangFlage,
        ),
      ],
    );
  }
}
