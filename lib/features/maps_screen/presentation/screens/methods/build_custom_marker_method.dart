import 'dart:ui';
import 'dart:ui' as ui;

import 'package:arch_team_power/features/maps_screen/presentation/screens/methods/load_image_method.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> buildCustomMarker({
  required String mainIcon,
  required String centerIcon,
  required double markerSize,
  required double centerSize,
}) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);

  final mainImg = await loadImage(mainIcon);
  final centerImg = await loadImage(centerIcon);

  canvas.drawImageRect(
    mainImg,
    Rect.fromLTWH(0, 0, mainImg.width.toDouble(), mainImg.height.toDouble()),
    Rect.fromLTWH(0, 0, markerSize, markerSize),
    Paint(),
  );

  canvas.drawImageRect(
    centerImg,
    Rect.fromLTWH(
      0,
      0,
      centerImg.width.toDouble(),
      centerImg.height.toDouble(),
    ),
    Rect.fromLTWH(
      (markerSize - centerSize) / 2,
      (markerSize - centerSize) / 2,
      centerSize,
      centerSize,
    ),
    Paint(),
  );

  final img = await pictureRecorder.endRecording().toImage(
    markerSize.toInt(),
    markerSize.toInt(),
  );

  final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(pngBytes!.buffer.asUint8List());
}
