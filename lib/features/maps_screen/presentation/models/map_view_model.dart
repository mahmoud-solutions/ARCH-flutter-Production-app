import 'dart:async';
import 'package:arch_team_power/features/maps_screen/presentation/models/location_service.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_place_model.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_polyline_utils.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_style_service.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/markers_service.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/routes_service.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel {
  final Function() onMapRefresh;
  final Completer<GoogleMapController> controller;

  String mapStyle = '';
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  final RoutesService routesService = RoutesService();
  final _location = LocationService();
  final _markers = MarkersService();
  final _style = MapStyleService();

  List<MapPlaceModel> places = [
    MapPlaceModel(id: "1", location: const LatLng(29.97529, 31.13755)),
    MapPlaceModel(id: "2", location: const LatLng(29.9785, 31.13600)),
    MapPlaceModel(id: "3", location: const LatLng(29.97620, 31.13340)),
  ];

  LatLng userLocation = const LatLng(30.046614845743317, 31.224309633308458);

  MapPlaceModel? get activePlace => places.where((p) => p.isActive).firstOrNull;

  MapViewModel({required this.onMapRefresh, required this.controller});

  Future<void> init() async {
    userLocation = await _location.getUserLocation();
    mapStyle = await _style.load();
    await buildMarkers();
  }

  Future<void> selectPlace(MapPlaceModel place) async {
    for (var p in places) p.isActive = false;
    place.isActive = true;
    polylines.clear();

    final points = await routesService.fetchRoutePoints(
      origin: userLocation,
      destination: place.location,
    );

    if (points.isNotEmpty) {
      addPolyline(points);
      await moveCamera(points);
    }

    await buildMarkers();
  }

  Future<void> buildMarkers() async {
    markers = await _markers.build(
      places: places,
      userLocation: userLocation,
      controller: controller,
      onTap: selectPlace,
    );
    onMapRefresh();
  }

  void clearSelection() {
    for (var p in places) p.isActive = false;
    polylines.clear();
    buildMarkers();
  }
}
