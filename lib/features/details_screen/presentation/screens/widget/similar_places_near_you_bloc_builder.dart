import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/similar_places_near_you_list_view.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarPlacesNearYouBlocBuilder extends StatelessWidget {
  const SimilarPlacesNearYouBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InscriptionsLibraryCubit>()..getInscriptions(),
      child: BlocBuilder<InscriptionsLibraryCubit, InscriptionsLibraryState>(
        builder: (context, state) {
          if (state is InscriptionsLibrarySuccess) {
            return SimilarPlacesNearYouListView(
              inscriptionsEntity: state.inscriptionsLibrary,
            );
          } else if (state is InscriptionsLibraryFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is InscriptionsLibraryEmpty) {
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
