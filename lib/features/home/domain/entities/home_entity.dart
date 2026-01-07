import 'package:arch_team_power/features/home/domain/entities/library_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/popular_places_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/slider_entity.dart';

class HomeEntity {
  final List<SliderEntity> sliders;
  final List<PopularSectionEntity> popularSections;
  final List<LibraryEntity> library;

  HomeEntity({
    required this.sliders,
    required this.popularSections,
    required this.library,
  });
}
