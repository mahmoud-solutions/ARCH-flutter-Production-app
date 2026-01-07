import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'image.dart';
import 'popular_place.dart';

class RuinModel extends InscriptionsEntity {
  const RuinModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.mapPhoto,
    super.vrUrl,
    super.soundUrl,
    required super.type,
    required super.typeLabel,
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
    required super.popularPlace,
    required super.status,
    required super.statusEn,
    required super.isClosed,
    required super.hasVr,
    required super.hasAudioGuide,
  });

  factory RuinModel.fromJson(Map<String, dynamic> json) {
    return RuinModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      mapPhoto: json['map_photo'],
      vrUrl: json['vr_url'],
      soundUrl: json['sound_url'],
      type: json['type'],
      typeLabel: json['type_label'],
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
          .map((e) => RuinImageModel.fromJson(e))
          .toList(),
      popularPlace: PopularPlaceModel.fromJson(json['popular_place']),
      status: json['status'],
      statusEn: json['status_en'],
      isClosed: json['is_closed'],
      hasVr: json['has_vr'],
      hasAudioGuide: json['has_audio_guide'],
    );
  }
}
