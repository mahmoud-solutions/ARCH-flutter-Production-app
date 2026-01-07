import 'place.data.dart';

class Datum {
  String? type;
  List<Place>? places;

  Datum({this.type, this.places});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json['type'] as String?,
    places: (json['places'] as List<dynamic>?)
        ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'places': places?.map((e) => e.toJson()).toList(),
  };
}
