import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackgroundPatternPainter extends CustomPainter {
  final double rotation;
  final double offsetShift;
  final List<ui.Image>? bgImages;

  BackgroundPatternPainter({
    required this.rotation,
    required this.offsetShift,
    this.bgImages,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // 🔹 رسم المربعات المتحركة
    final squareSize = size.width * 0.4;
    final offsets = [
      Offset(40 + offsetShift, 80 + offsetShift / 2),
      Offset(size.width * 0.55 - offsetShift / 2, size.height * 0.15),
      Offset(size.width * 0.15, size.height * 0.7 - offsetShift),
      Offset(size.width * 0.65, size.height * 0.6 + offsetShift / 2),
    ];

    for (var offset in offsets) {
      final rect = Rect.fromLTWH(offset.dx, offset.dy, squareSize, squareSize);
      canvas.save();
      canvas.translate(rect.center.dx, rect.center.dy);
      canvas.rotate(rotation);
      canvas.translate(-rect.center.dx, -rect.center.dy);
      canvas.drawRect(rect, paint);
      canvas.restore();
    }

    // 🔹 رسم الصور الخافتة المتعددة
    if (bgImages != null && bgImages!.isNotEmpty) {
      final positions = [
        Offset(size.width * 0.1, size.height * 0.2 + offsetShift / 4),
        Offset(size.width * 0.55, size.height * 0.35 - offsetShift / 3),
        Offset(size.width * 0.25, size.height * 0.75 + offsetShift / 5),
        Offset(size.width * 0.7, size.height * 0.7 - offsetShift / 6),
      ];

      final paintImageLayer = Paint()
        ..colorFilter = const ColorFilter.mode(Colors.black26, BlendMode.srcIn);

      for (int i = 0; i < bgImages!.length && i < positions.length; i++) {
        final img = bgImages![i];
        final pos = positions[i];
        canvas.save();
        canvas.translate(pos.dx, pos.dy);
        canvas.scale(1.2);
        canvas.drawImage(img, Offset.zero, paintImageLayer);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
