import 'package:arch_team_power/features/home/data/model/sub_places/sub_place_image_model.dart';
import 'package:arch_team_power/features/home/data/model/sub_places/sub_places_popular_place_model.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';

class SubPlaceModel extends SubPlaceEntity {
  const SubPlaceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    super.mapPhoto,
    super.vrUrl,
    super.soundUrl,
    super.findingDetails,
    super.openingHours,
    super.inscriptionTranslation,
    required super.location,
    required super.governorateName,
    super.regionName,
    required super.rate,
    required super.totalReviews,
    required super.totalComments,
    required super.lat,
    required super.lng,
    required super.workDate,
    required super.images,
    super.popularPlace,
    super.similarPlaces,
    required super.order,
    required super.isFavorite,
  });

  factory SubPlaceModel.fromJson(Map<String, dynamic> json) {
    return SubPlaceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      mapPhoto: json['map_photo'],
      vrUrl: json['vr_url'],
      soundUrl: json['sound_url'],
      findingDetails: json['finding_details'],
      openingHours: json['opening_hours'],
      inscriptionTranslation: json['inscription_translation'],
      location: json['location'],
      governorateName: json['governorate_name'],
      regionName: json['region_name'],
      rate: (json['rate'] as num).toDouble(),
      totalReviews: json['total_reviews'],
      totalComments: json['total_comments'],
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      workDate: json['work_date'],
      images: (json['images'] as List)
          .map((e) => SubPlaceImageModel.fromJson(e))
          .toList(),
      popularPlace: json['popular_place'] != null
          ? SubPlacesPopularPlaceModel.fromJson(json['popular_place'])
          : null,
      similarPlaces: json['similar_places'] != null
          ? (json['similar_places'] as List)
                .map((e) => SubPlaceModel.fromJson(e))
                .toList()
          : null,
      order: json['order'],
      isFavorite: json['is_active'],
    );
  }
}
