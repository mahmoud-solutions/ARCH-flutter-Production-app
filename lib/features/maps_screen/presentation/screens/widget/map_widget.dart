import 'dart:async';

import 'package:arch_team_power/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final Completer<GoogleMapController> controller;
  final String mapStyle;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final Function(LatLng) onMapTapped;
  final Function(GoogleMapController) onMapCreated;

  const MapWidget({
    super.key,
    required this.controller,
    required this.mapStyle,
    required this.markers,
    required this.polylines,
    required this.onMapTapped,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      key: const ValueKey(AppKeys.kGoogleMapsKey),

      initialCameraPosition: const CameraPosition(
        target: LatLng(29.9773, 31.1325),
        zoom: 14.5,
      ),
      style: mapStyle,
      zoomControlsEnabled: false,
      markers: markers,
      polylines: polylines,
      onMapCreated: onMapCreated,
      onTap: onMapTapped,
    );
  }
}
