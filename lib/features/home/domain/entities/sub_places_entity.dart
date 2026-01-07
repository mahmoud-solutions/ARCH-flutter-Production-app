import 'package:arch_team_power/features/home/domain/entities/sub_places_image.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_popular_place_entity.dart';

class SubPlaceEntity {
  final int id;
  final String name;
  final String description;
  final String image;
  final String? mapPhoto;
  final String? vrUrl;
  final String? soundUrl;
  final String? findingDetails;
  final String? openingHours;
  final String? inscriptionTranslation;
  final String location;
  final String governorateName;
  final String? regionName;
  final double rate;
  final int totalReviews;
  final int totalComments;
  final double lat;
  final double lng;
  final String workDate;
  final List<SubPlaceImageEntity> images;
  final SubPlacesPopularPlaceEntity? popularPlace;
  final List<SubPlaceEntity>? similarPlaces;
  final int order;
  final bool isFavorite;

  const SubPlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.mapPhoto,
    this.vrUrl,
    this.soundUrl,
    this.findingDetails,
    this.openingHours,
    this.inscriptionTranslation,
    required this.location,
    required this.governorateName,
    this.regionName,
    required this.rate,
    required this.totalReviews,
    required this.totalComments,
    required this.lat,
    required this.lng,
    required this.workDate,
    required this.images,
    this.popularPlace,
    this.similarPlaces,
    required this.order,
    required this.isFavorite,
  });
}
