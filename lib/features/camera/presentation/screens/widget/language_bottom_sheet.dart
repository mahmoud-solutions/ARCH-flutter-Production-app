import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/lang_search_text_files.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/lang_radio_group.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/open_lang_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
    required this.initialLang,
    required this.languages,
  });
  final String initialLang;
  final List<LanguageOption> languages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 27.h),
          Text("الترجمه إلى", style: AppTextStyles.syleNorsalMedium17(context)),
          SizedBox(height: 34.h),

          const LangSearchTextFiled(),
          const SizedBox(height: 16),
          LangRadioGroup(initialLang: initialLang, languages: languages),
        ],
      ),
    );
  }
}
