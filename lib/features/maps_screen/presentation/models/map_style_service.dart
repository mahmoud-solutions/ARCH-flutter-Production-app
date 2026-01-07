import 'package:arch_team_power/core/utils/map_styles.dart';
import 'package:flutter/services.dart';

class MapStyleService {
  Future<String> load() async {
    return await rootBundle.loadString(MapStyles.kMapStyle);
  }
}
