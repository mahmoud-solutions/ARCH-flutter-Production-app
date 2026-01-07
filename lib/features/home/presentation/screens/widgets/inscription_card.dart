import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/widgets/custom_fav_button.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/favorite_key.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/inscription_item_image.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/inscription_item_lication_and_status.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/inscription_item_title_and_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InscriptionItem extends StatelessWidget {
  const InscriptionItem({super.key, required this.inscriptionsEntity});
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => GoRouter.of(
          context,
        ).push(AppRouter.kInscriptionDetailsScreen, extra: inscriptionsEntity),

        child: Container(
          width: 190.w,
          height: 114.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.09),
                blurRadius: 10.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 8),

                  InscriptionItemImage(inscriptionsEntity: inscriptionsEntity),
                  const SizedBox(height: 5),
                  InscriptionItemTitleAndRate(
                    title: inscriptionsEntity.name,
                    rating: inscriptionsEntity.rate,
                  ),
                  InscriptionItemLicationAndStatus(
                    location: inscriptionsEntity.location,
                    status: inscriptionsEntity.status,
                  ),
                ],
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: BlocBuilder<PostFavouriteCubit, Map<String, Set<int>>>(
                  builder: (context, favs) {
                    final isFav = favs[FavouriteType.ruin]!.contains(
                      inscriptionsEntity.id,
                    );

                    return CustomFavButton(
                      isActive: isFav,
                      onTap: () {
                        context.read<PostFavouriteCubit>().toggleFavourite(
                          id: inscriptionsEntity.id,
                          type: FavouriteType.ruin,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
