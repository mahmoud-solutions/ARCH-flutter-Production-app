import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/map_screen_body.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: MapScreenBody(),
      ),
    );
  }
}
