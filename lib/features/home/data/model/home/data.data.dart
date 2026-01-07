import 'popular_places.data.dart';
import 'slider.data.dart';

class Dataa {
  List<Sliderr>? sliders;
  PopularPlaces? popularPlaces;
  List<dynamic>? library;

  Dataa({this.sliders, this.popularPlaces, this.library});

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
    sliders: (json['sliders'] as List<dynamic>?)
        ?.map((e) => Sliderr.fromJson(e as Map<String, dynamic>))
        .toList(),
    popularPlaces: json['popular_places'] == null
        ? null
        : PopularPlaces.fromJson(
            json['popular_places'] as Map<String, dynamic>,
          ),
    library: json['library'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'sliders': sliders?.map((e) => e.toJson()).toList(),
    'popular_places': popularPlaces?.toJson(),
    'library': library,
  };
}
