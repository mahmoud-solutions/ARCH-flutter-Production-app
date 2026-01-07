import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('المسافة', style: AppTextStyles.syleNorsalMedium14(context)),
        const SizedBox(height: 8),
        RangeSlider(
          values: const RangeValues(10, 1000),
          min: 10,
          max: 3000,
          divisions: 299,
          activeColor: const Color(0xFFD2B48C),
          inactiveColor: Colors.grey,
          labels: const RangeLabels('10', '1000'),
          onChanged: (RangeValues values) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '4 ك',
              style: AppTextStyles.syleNorsalMedium12(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
            Text(
              '10 ك',
              style: AppTextStyles.syleNorsalMedium12(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
            Text(
              '1000 ك',
              style: AppTextStyles.syleNorsalMedium12(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
            Text(
              '3000 ك',
              style: AppTextStyles.syleNorsalMedium12(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
          ],
        ),
      ],
    );
  }
}
