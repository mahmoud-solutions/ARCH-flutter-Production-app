import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/Search_Fliter/presentation/screens/manger/cubits/search_filter_cubit/search_filter_cubit.dart';
import 'package:arch_team_power/features/Search_Fliter/presentation/screens/widgets/chip_custom_widgets.dart';
import 'package:arch_team_power/features/Search_Fliter/presentation/screens/widgets/distance_slider.dart';
import 'package:arch_team_power/features/Search_Fliter/presentation/screens/widgets/raiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterUI extends StatelessWidget {
  const FilterUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchFilterCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,

            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 34.h),
                  const CustomAppBar(title: 'تصفية البحث'),
                  SizedBox(height: 34.h),

                  Text(
                    'النوع',
                    style: AppTextStyles.syleNorsalMedium14(context),
                  ),
                  const SizedBox(height: 13),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      const CustomChip(
                        text: "دينيه",
                        textColor: AppColors.background,
                        backgroundColor: AppColors.primary,
                      ),
                      CustomChip(
                        text: "متاحف",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background,
                        border: Border.all(color: Colors.grey),
                      ),
                      CustomChip(
                        text: "نقوش",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background,
                        border: Border.all(color: Colors.grey),
                      ),
                      CustomChip(
                        text: "متاحف",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background,
                        border: Border.all(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const DistanceSlider(),

                  const SizedBox(height: 16),

                  Text(
                    'التقييم',
                    style: AppTextStyles.syleNorsalMedium14(context),
                  ),
                  Column(
                    children: [
                      buildRatingTile(context, '5.0 - 4.5', 5),
                      buildRatingTile(context, '4.4 - 4.0', 4),
                      buildRatingTile(context, '3.9 - 3.5', 4),
                      buildRatingTile(context, '3.4 - 3.0', 3),
                      buildRatingTile(context, '2.9 - 2.5', 3),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'نوع الكتابه',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 13),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      const CustomChip(
                        text: "دينيه",
                        textColor: AppColors.background,
                        backgroundColor: AppColors.primary,
                      ),
                      CustomChip(
                        text: "تاريخيه",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background,
                        border: Border.all(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'لغة التجمه',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      const CustomChip(
                        text: "دينيه",
                        textColor: AppColors.background,
                        backgroundColor: AppColors.primary,
                      ),
                      CustomChip(
                        text: "تاريخيه",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background,
                        border: Border.all(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
