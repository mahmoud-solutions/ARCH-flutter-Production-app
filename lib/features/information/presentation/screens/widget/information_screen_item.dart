import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/widgets/custom_fav_button.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/favorite_key.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/information/presentation/screens/widget/information_screen_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InformationScreenItem extends StatelessWidget {
  const InformationScreenItem({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () => GoRouter.of(
          context,
        ).push(AppRouter.kDetailsScreen, extra: subPlaceEntity),
        child: Stack(
          children: [
            Container(
              height: 130.h,
              width: 297.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: InformationScreenItemDetails(
                subPlaceEntity: subPlaceEntity,
              ),
            ),
            Positioned(
              top: 10.5.h,
              left: 11.5.w,
              child: BlocBuilder<PostFavouriteCubit, Map<String, Set<int>>>(
                builder: (context, favs) {
                  final isFav = favs[FavouriteType.subPlace]!.contains(
                    subPlaceEntity.id,
                  );

                  return CustomFavButton(
                    isActive: isFav,
                    onTap: () {
                      context.read<PostFavouriteCubit>().toggleFavourite(
                        id: subPlaceEntity.id,
                        type: FavouriteType.subPlace,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
