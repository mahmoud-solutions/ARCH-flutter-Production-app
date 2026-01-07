// ========== Widget: الكارت + السلايدر + الشادو ==========
import 'package:flutter/material.dart';

class CardSliderWidget extends StatelessWidget {
  final List<String> images;
  const CardSliderWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 200,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 20,
                  offset: const Offset(0, 40),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    "assets/image/cardvisa.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
