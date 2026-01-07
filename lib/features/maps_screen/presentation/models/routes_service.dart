import 'dart:convert';
import 'package:arch_team_power/core/utils/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutesService {
  final String apiKey = AppKeys.kGoogleMapsKey;

  Future<List<LatLng>> fetchRoutePoints({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json["routes"].isEmpty) return [];

    final polyline = json["routes"][0]["overview_polyline"]["points"];
    return decodePolyline(polyline);
  }

  List<LatLng> decodePolyline(String polyline) {
    List<LatLng> decoded = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int shift = 0, result = 0;
      int b;

      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      decoded.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return decoded;
  }
}
