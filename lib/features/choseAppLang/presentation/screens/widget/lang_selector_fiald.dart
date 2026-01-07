import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangSelectorFiald extends StatelessWidget {
  const LangSelectorFiald({super.key, required this.isOpen});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 297.w,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.choose_app_language,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),
          const Spacer(),
          Icon(isOpen ? Icons.expand_less : Icons.expand_more),
        ],
      ),
    );
  }
}
