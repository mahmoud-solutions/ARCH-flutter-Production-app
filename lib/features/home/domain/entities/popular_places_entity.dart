import 'package:arch_team_power/features/home/domain/entities/places_intity.dart';

class PopularSectionEntity {
  final String type;
  final List<PlaceEntity> places;

  PopularSectionEntity({required this.type, required this.places});
}
