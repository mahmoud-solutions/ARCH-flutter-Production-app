import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'inscription_card.dart';

class InscriptionLibraryList extends StatelessWidget {
  const InscriptionLibraryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InscriptionsLibraryCubit, InscriptionsLibraryState>(
      builder: (context, state) {
        if (state is InscriptionsLibrarySuccess) {
          return SizedBox(
            height: 145.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.inscriptionsLibrary.length,
              itemBuilder: (context, index) {
                return InscriptionItem(
                      inscriptionsEntity: state.inscriptionsLibrary[index],
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: (index * 200).ms)
                    .slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      curve: Curves.easeOut,
                    );
              },
            ),
          );
        } else if (state is InscriptionsLibraryEmpty) {
          return Center(
            child: Text(
              'No Data',
              style: AppTextStyles.syleNorsalMedium15(context),
            ),
          );
        } else if (state is InscriptionsLibraryFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
