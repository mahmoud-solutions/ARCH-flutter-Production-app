import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/pubularPlaces/pobular_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamousPlacesList extends StatelessWidget {
  const FamousPlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PobularCubit, PobularState>(
      builder: (context, state) {
        if (state is PobularLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PobularError) {
          return Center(child: Text(state.message));
        } else if (state is PobularLoaded) {
          final places = state.popularPlaces;
          return SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 14.w),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                final imageUrl = place.image ?? '';

                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Column(
                    children: [
                      Container(
                        height: 65.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),

                      SizedBox(height: 5.h),
                      Text(
                        place.nameAr ?? 'بدون اسم',
                        style: AppTextStyles.syleNorsalRegular10(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
