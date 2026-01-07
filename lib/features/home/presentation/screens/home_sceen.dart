import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/Inscriptions_details_cubit/inscriptions_details_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/banner_cubit/banner_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/slider_cubit/slider_cubit_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/pubularPlaces/pobular_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_cubit/sub_places_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_details_cubit/sub_places_details_cubit.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/home_screen_body.dart';
import 'package:arch_team_power/features/profile/domain/repo/profile_repo.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<SliderCubitCubit>()..fetchSliders(),
          ),
          BlocProvider(
            create: (context) => sl<PobularCubit>()..fetchPopularPlaces(),
          ),
          BlocProvider(create: (context) => sl<BannerCubit>()..fetchBanners()),
          BlocProvider(
            create: (context) =>
                ProfileDataCubit(sl<ProfileRepo>())..getProfileData(),
          ),
          BlocProvider(create: (context) => sl<InscriptionsDetailsCubit>()),
          BlocProvider(
            create: (context) =>
                sl<InscriptionsLibraryCubit>()..getInscriptions(),
          ),
          BlocProvider(
            create: (context) => sl<SubPlacesCubit>()..getSubPlaces(),
          ),
          BlocProvider(create: (context) => sl<SubPlacesDetailsCubit>()),
          BlocProvider(
            create: (context) =>
                sl<PostFavouriteCubit>()..loadInitialFavourites(),
          ),
        ],
        child: const SafeArea(child: HomeScreenBody()),
      ),
    );
  }
}
