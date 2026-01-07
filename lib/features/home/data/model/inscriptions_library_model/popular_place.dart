import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_popular_place_entity.dart';

class PopularPlaceModel extends InscriptionsLibraryPopularPlaceEntity {
  const PopularPlaceModel({
    required super.id,
    required super.name,
    required super.nameAr,
    required super.nameEn,
    required super.description,
    required super.image,
    required super.icon,
    required super.order,
  });

  factory PopularPlaceModel.fromJson(Map<String, dynamic> json) {
    return PopularPlaceModel(
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
