import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.didnt_receive_code,
          style: AppTextStyles.syleNorsalRegular14(context),
        ),
        const SizedBox(width: 3),
        GestureDetector(
          onTap: onTap,
          child: Text(
            AppLocalizations.of(context)!.resend_it,
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: const Color(0xffDB9448)),
          ),
        ),
      ],
    );
  }
}
