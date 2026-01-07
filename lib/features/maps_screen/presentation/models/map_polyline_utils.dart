import 'dart:math';

import 'package:arch_team_power/features/maps_screen/presentation/models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PolylineExtensions on MapViewModel {
  void addPolyline(List<LatLng> points) {
    polylines.add(
      Polyline(
        polylineId: const PolylineId("route"),
        color: const Color(0xFFD2B48C),
        width: 6,
        points: points,
        jointType: JointType.round,
      ),
    );
  }

  Future<void> moveCamera(List<LatLng> points) async {
    final cameraController = await controller.future;
    cameraController.animateCamera(
      CameraUpdate.newLatLngBounds(LatLngBoundsUtil.fromList(points), 110),
    );
  }
}

class LatLngBoundsUtil {
  static LatLngBounds fromList(List<LatLng> list) {
    double minLat = list.first.latitude;
    double maxLat = list.first.latitude;
    double minLng = list.first.longitude;
    double maxLng = list.first.longitude;

    for (var p in list) {
      minLat = min(minLat, p.latitude);
      maxLat = max(maxLat, p.latitude);
      minLng = min(minLng, p.longitude);
      maxLng = max(maxLng, p.longitude);
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}
