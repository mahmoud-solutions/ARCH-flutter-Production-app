import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:arch_team_power/features/library/presentation/screens/widget/library_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreenSliverGridView extends StatelessWidget {
  const LibraryScreenSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InscriptionsLibraryCubit, InscriptionsLibraryState>(
      builder: (context, state) {
        if (state is InscriptionsLibrarySuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            clipBehavior: Clip.none,
            itemCount: state.inscriptionsLibrary.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (context, index) => Center(
              child: LibraryScreenItem(
                inscriptionsEntity: state.inscriptionsLibrary[index],
              ),
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
