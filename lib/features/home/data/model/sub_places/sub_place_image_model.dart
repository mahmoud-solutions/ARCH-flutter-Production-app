import 'package:arch_team_power/features/home/domain/entities/sub_places_image.dart';

class SubPlaceImageModel extends SubPlaceImageEntity {
  const SubPlaceImageModel({
    required super.id,
    required super.image,
    required super.order,
  });

  factory SubPlaceImageModel.fromJson(Map<String, dynamic> json) {
    return SubPlaceImageModel(
      id: json['id'],
      image: json['image'],
      order: json['order'],
    );
  }
}
