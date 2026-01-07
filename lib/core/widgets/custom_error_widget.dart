import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppTextStyles.syleNorsalRegular14(
          context,
        ).copyWith(color: Colors.red),
      ),
    );
  }
}
