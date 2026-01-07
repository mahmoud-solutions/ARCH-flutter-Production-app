import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_image_entity.dart';

class RuinImageModel extends RuinImageEntity {
  const RuinImageModel({required super.id, required super.image});

  factory RuinImageModel.fromJson(Map<String, dynamic> json) {
    return RuinImageModel(id: json['id'], image: json['image']);
  }
}
