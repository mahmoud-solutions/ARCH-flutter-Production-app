class LatLngModel {
  double? latitude;
  double? longitude;

  LatLngModel({this.latitude, this.longitude});

  factory LatLngModel.fromJson(Map<String, dynamic> json) => LatLngModel(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };
}

class LocationModel {
  LatLngModel? latLng;
  LocationModel({this.latLng});
  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    latLng: json['latLng'] == null
        ? null
        : LatLngModel.fromJson(json['latLng']),
  );
  Map<String, dynamic> toJson() => {'latLng': latLng?.toJson()};
}

class LocationInfoModel {
  LocationModel? location;
  LocationInfoModel({this.location});
  factory LocationInfoModel.fromJson(Map<String, dynamic> json) =>
      LocationInfoModel(
        location: json['location'] == null
            ? null
            : LocationModel.fromJson(json['location']),
      );
  Map<String, dynamic> toJson() => {'location': location?.toJson()};
}

class Polyline {
  String? encodedPolyline;
  Polyline({this.encodedPolyline});
  factory Polyline.fromJson(Map<String, dynamic> json) =>
      Polyline(encodedPolyline: json['encodedPolyline']);
  Map<String, dynamic> toJson() => {'encodedPolyline': encodedPolyline};
}

class RouteModel {
  int? distanceMeters;
  String? duration;
  Polyline? polyline;
  RouteModel({this.distanceMeters, this.duration, this.polyline});
  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
    distanceMeters: json['distanceMeters'] as int?,
    duration: json['duration'] as String?,
    polyline: json['polyline'] == null
        ? null
        : Polyline.fromJson(json['polyline']),
  );
}

class RoutesModel {
  List<RouteModel>? routes;
  RoutesModel({this.routes});
  factory RoutesModel.fromJson(Map<String, dynamic> json) => RoutesModel(
    routes: (json['routes'] as List<dynamic>?)
        ?.map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
