import 'package:arch_team_power/features/favorite_screen/presentation/manger/get_favourite_cubite/cubit/get_favourite_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manger/get_favourite_cubite/cubit/get_favourite_cubit.dart';
import 'fav_item_card.dart';

class FavList extends StatelessWidget {
  const FavList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetFavouriteLoaded) {
          final favItems = state.response.data ?? [];
          if (favItems.isEmpty) {
            return Center(child: Text('لا توجد عناصر'));
          }
          return ListView.builder(
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              final fav = favItems[index];
              return FavItemCard(
                name: fav.name ?? '',
                description: fav.description ?? '',
                image: fav.image ?? '',
                mapPhoto: fav.mapPhoto ?? '',
                totalReviews: (fav.totalReviews ?? 0).toString(),
                averageRating: fav.averageRating ?? '',
              );
            },
          );
        } else if (state is GetFavouriteError) {
          return Center(child: Text(state.message));
        }
        return SizedBox();
      },
    );
  }
}
