import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/sub_place_similar_places_near_you_list_view.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_cubit/sub_places_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubPlaceSimilarPlacesNearBlocBuilder extends StatelessWidget {
  const SubPlaceSimilarPlacesNearBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SubPlacesCubit>()..getSubPlaces(),
      child: BlocBuilder<SubPlacesCubit, SubPlacesState>(
        builder: (context, state) {
          if (state is SubPlacesSuccess) {
            return SubPlaceSimilarPlacesNearYouListView(
              subPlaceEntity: state.subPlaces,
            );
          } else if (state is SubPlacesFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is SubPlacesEmpty) {
            return Center(
              child: Text(
                'No Data',
                style: AppTextStyles.syleNorsalMedium15(context),
              ),
            );
          } else {
            return const CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }
}
