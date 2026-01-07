import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

Widget buildRatingTile(BuildContext context, String label, int stars) {
  return RadioListTile<int>(
    value: 1,
    groupValue: 0,
    onChanged: null,
    controlAffinity:
        ListTileControlAffinity.trailing, // دي تخلي النقطة على الشمال
    activeColor: Colors.yellow, // ده يخلي النقطة نفسها لونها أصفر
    title: Row(
      children: [
        Row(
          children: List.generate(
            stars,
            (index) => Image.asset(
              AppAssets.kRatingStar,
              width: 20, //
              height: 20,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          label,
          style: AppTextStyles.syleNorsalMedium14(
            context,
          ).copyWith(color: const Color(0xFF8A8A8A)),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}
