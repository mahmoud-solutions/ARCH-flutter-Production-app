import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionItemTitleAndRate extends StatelessWidget {
  const InscriptionItemTitleAndRate({
    super.key,
    required this.title,
    required this.rating,
  });

  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: AppTextStyles.syleNorsalMedium12(context),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 2.w),
              Text(
                "(${rating})",
                style: AppTextStyles.syleNorsalMedium10(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
