import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CameraActions extends StatelessWidget {
  const CameraActions({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: AppTextStyles.syleNorsalMedium14(
          context,
        ).copyWith(color: Colors.white),
      ),
    );
  }
}
