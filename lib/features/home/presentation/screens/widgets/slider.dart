import 'package:arch_team_power/features/home/presentation/manger/cubits/banner_cubit/banner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerCubitLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
            child: SizedBox(
              height: 75.h,
              child: PageView.builder(
                itemCount: state.banners.length,
                itemBuilder: (context, index) {
                  final banner = state.banners[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      banner.image!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is BannerCubitError) {
          return const Center(child: Text("error"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
