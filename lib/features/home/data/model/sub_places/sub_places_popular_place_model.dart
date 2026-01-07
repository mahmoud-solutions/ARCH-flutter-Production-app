import 'package:arch_team_power/features/home/domain/entities/sub_places_popular_place_entity.dart';

class SubPlacesPopularPlaceModel extends SubPlacesPopularPlaceEntity {
  const SubPlacesPopularPlaceModel({
    required super.id,
    required super.name,
    required super.nameAr,
    required super.nameEn,
    required super.description,
    required super.image,
    required super.icon,
    required super.order,
  });

  factory SubPlacesPopularPlaceModel.fromJson(Map<String, dynamic> json) {
    return SubPlacesPopularPlaceModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      description: json['description'],
      image: json['image'],
      icon: json['icon'],
      order: json['order'],
    );
  }
}
