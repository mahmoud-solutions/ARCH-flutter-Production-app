import 'dart:async';
import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_view_model.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/map_search_text_field.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/map_widget.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/some_details_about_the_active_location.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenBody extends StatefulWidget {
  const MapScreenBody({super.key});
  @override
  State<MapScreenBody> createState() => _MapScreenBodyState();
}

class _MapScreenBodyState extends State<MapScreenBody> {
  final Completer<GoogleMapController> controller = Completer();
  late final MapViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MapViewModel(
      onMapRefresh: () => setState(() {}),
      controller: controller,
    );
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            controller: controller,
            mapStyle: viewModel.mapStyle,
            markers: viewModel.markers,
            polylines: viewModel.polylines,
            onMapTapped: (position) => viewModel.clearSelection(),
            onMapCreated: (c) => controller.complete(c),
          ),
          const MapSearchTextField(),
          if (viewModel.activePlace != null)
            SomeDetailsAboutTheActivePlace(
              place: viewModel.activePlace!,
              onTap: () => context.push(
                AppRouter.kDetailsScreen,
                extra: viewModel.activePlace,
              ),
            ),
        ],
      ),
    );
  }
}
