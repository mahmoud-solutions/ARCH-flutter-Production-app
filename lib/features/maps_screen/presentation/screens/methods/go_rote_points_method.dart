import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<LatLng>> getRoutePoints(LatLng origin, LatLng destination) async {
  final polylinePoints = PolylinePoints();

  final request = PolylineRequest(
    origin: PointLatLng(origin.latitude, origin.longitude),
    destination: PointLatLng(destination.latitude, destination.longitude),
    mode: TravelMode.driving,
  );

  final result = await polylinePoints.getRouteBetweenCoordinates(
    request: request,
  );

  if (result.points.isNotEmpty) {
    return result.points.map((p) => LatLng(p.latitude, p.longitude)).toList();
  }

  if (result.errorMessage != null) {}
  return [];
}
