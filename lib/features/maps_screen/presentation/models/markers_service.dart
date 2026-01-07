import 'dart:async';

import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_place_model.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/methods/build_custom_marker_method.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersService {
  Future<Set<Marker>> build({
    required List<MapPlaceModel> places,
    required LatLng userLocation,
    required Completer<GoogleMapController> controller,
    required Function(MapPlaceModel) onTap,
  }) async {
    Set<Marker> markers = {};
    final mapController = await controller.future;
    final zoom = await mapController.getZoomLevel();

    for (var place in places) {
      final icon = await buildCustomMarker(
        mainIcon: place.isActive
            ? AppIcons.kSlectedMarkerIcon
            : AppIcons.kUnSlectedMarkerIcon,
        centerIcon: AppIcons.kTestIcon,
        markerSize: (place.isActive ? 65.0 : 45.0) * (zoom / 14.5),
        centerSize: (place.isActive ? 35.0 : 25.0) * (zoom / 14.5),
      );

      markers.add(
        Marker(
          markerId: MarkerId(place.id),
          position: place.location,
          icon: icon,
          onTap: () => onTap(place),
        ),
      );
    }

    final userIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(30, 33)),
      AppIcons.kUserLocatMarkerIcon,
    );

    markers.add(
      Marker(
        markerId: const MarkerId("user"),
        position: userLocation,
        icon: userIcon,
      ),
    );

    return markers;
  }
}
