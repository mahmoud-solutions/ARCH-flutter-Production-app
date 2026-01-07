import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_cubit/sub_places_cubit.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/archaeological_information_header.dart';
import 'package:arch_team_power/features/information/presentation/screens/widget/information_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchaeologicalInformationWidget extends StatelessWidget {
  const ArchaeologicalInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ArchaeologicalInformationHeader(),
        BlocBuilder<SubPlacesCubit, SubPlacesState>(
          builder: (context, state) {
            if (state is SubPlacesSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.subPlaces.length,
                  itemBuilder: (context, index) => InformationScreenItem(
                    subPlaceEntity: state.subPlaces[index],
                  ),
                ),
              );
            } else if (state is SubPlacesEmpty) {
              return Center(
                child: Text(
                  'No Data',
                  style: AppTextStyles.syleNorsalMedium15(context),
                ),
              );
            } else if (state is SubPlacesFailure) {
              return CustomErrorWidget(errorMessage: state.errorMessage);
            } else {
              return const CustomCircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
