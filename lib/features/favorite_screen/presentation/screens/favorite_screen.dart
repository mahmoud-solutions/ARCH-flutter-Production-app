import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/get_favourite_cubite/cubit/get_favourite_cubit.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_cubit/sub_places_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/fav_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  final int placeId = 1;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFavouriteCubit>(
          create: (context) => sl<PostFavouriteCubit>(),
        ),
        BlocProvider<SubPlacesCubit>(create: (context) => sl<SubPlacesCubit>()),
        BlocProvider<GetFavouriteCubit>(
          create: (context) => sl<GetFavouriteCubit>()..fetchFavourites(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.86.w),

            child: Column(
              children: [
                SizedBox(height: 34.h),
                const CustomAppBar(title: "المفضلة"),
                SizedBox(height: 34.h),
                Expanded(child: FavList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
