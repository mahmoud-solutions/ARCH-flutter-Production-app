import 'package:arch_team_power/features/maps_screen/presentation/models/permission.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  Future<LatLng> getUserLocation() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return fallback;
    try {
      final pos = await Geolocator.getCurrentPosition();
      return LatLng(pos.latitude, pos.longitude);
    } catch (_) {
      return fallback;
    }
  }

  static const fallback = LatLng(30.046614845743317, 31.224309633308458);
}
