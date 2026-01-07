import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_image_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_popular_place_entity.dart';

class InscriptionsEntity {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String mapPhoto;
  final String? vrUrl;
  final String? soundUrl;
  final String type;
  final String typeLabel;
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
  final List<RuinImageEntity> images;
  final InscriptionsLibraryPopularPlaceEntity popularPlace;
  final List<InscriptionsEntity>? similarPlaces;

  final String status;
  final String statusEn;
  final bool isClosed;
  final bool hasVr;
  final bool hasAudioGuide;
  final bool isFavorite;

  const InscriptionsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.mapPhoto,
    this.vrUrl,
    this.soundUrl,
    required this.type,
    required this.typeLabel,
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
    required this.popularPlace,
    required this.status,
    required this.statusEn,
    this.similarPlaces,
    required this.isClosed,
    required this.hasVr,
    required this.hasAudioGuide,
    this.isFavorite = false,
  });
}
