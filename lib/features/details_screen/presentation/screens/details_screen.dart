import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_body.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_details_cubit/sub_places_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8f8),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              sl<SubPlacesDetailsCubit>()
                ..getSubPlacesDetails(id: subPlaceEntity.id),
          child: DetailsScreenBody(subPlaceEntity: subPlaceEntity),
        ),
      ),
    );
  }
}
