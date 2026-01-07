import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/open_lang_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangRadio extends StatelessWidget {
  const LangRadio({super.key, required this.lang});

  final LanguageOption lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Radio<String>(value: lang.code, activeColor: const Color(0xffD2B48C)),
          const Spacer(),
          Expanded(
            child: Text(
              lang.name,
              style: AppTextStyles.syleNorsalMedium17(context),
            ),
          ),
          Image.asset(lang.flag, width: 25.w, height: 25.h),
        ],
      ),
    );
  }
}
