import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomZoomButton extends StatelessWidget {
  const CustomZoomButton({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
    required this.currentZoom,
    required this.onZoomChanged,
  });

  final String label;
  final double value;
  final CameraController? controller;
  final double currentZoom;
  final Function(double) onZoomChanged;

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentZoom == value;

    return GestureDetector(
      onTap: () async {
        onZoomChanged(value);
        await controller?.setZoomLevel(value);
      },
      child: Column(
        children: [
          Container(
            width: isActive ? 26.w : 19.w,
            height: isActive ? 26.h : 19.h,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : const Color(0x91FFFBFB),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                label,
                style: AppTextStyles.syleNorsalSemiBold7(
                  context,
                ).copyWith(color: const Color(0xFFDB9448)),
              ),
            ),
          ),
          if (isActive)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
