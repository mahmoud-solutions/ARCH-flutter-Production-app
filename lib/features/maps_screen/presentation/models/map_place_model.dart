import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPlaceModel {
  final String id;
  final LatLng location;
  bool isActive;

  MapPlaceModel({
    required this.id,
    required this.location,
    this.isActive = false,
  });
}
