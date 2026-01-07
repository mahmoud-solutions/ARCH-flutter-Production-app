import 'package:arch_team_power/features/camera/presentation/screens/widget/custom_zomm_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ZommButtons extends StatefulWidget {
  const ZommButtons({super.key, required this.controller});

  final CameraController? controller;

  @override
  State<ZommButtons> createState() => _ZommButtonsState();
}

class _ZommButtonsState extends State<ZommButtons> {
  double zoom = 1.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomZoomButton(
          label: "1x",
          value: 1.0,
          controller: widget.controller,
          currentZoom: zoom,
          onZoomChanged: (val) => setState(() => zoom = val),
        ),
        const SizedBox(width: 10),
        CustomZoomButton(
          label: "1.5x",
          value: 1.5,
          controller: widget.controller,
          currentZoom: zoom,
          onZoomChanged: (val) => setState(() => zoom = val),
        ),
        const SizedBox(width: 10),
        CustomZoomButton(
          label: "2x",
          value: 2.0,
          controller: widget.controller,
          currentZoom: zoom,
          onZoomChanged: (val) => setState(() => zoom = val),
        ),
      ],
    );
  }
}
