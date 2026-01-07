import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? borderColor;

  const ActionButton({
    required this.title,
    this.backgroundColor,
    this.textColor,
    super.key,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 35,

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: borderColor ?? Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.syleNorsalMedium15(
            context,
          ).copyWith(color: textColor),
        ),
      ),
    );
  }
}
