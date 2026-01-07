import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        height: 7,
        width: isActive ? 19 : 7,
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFD2B48C) : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
