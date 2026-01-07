import 'package:arch_team_power/core/widgets/custom_fav_button.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/library/presentation/screens/widget/library_screen_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreenItem extends StatelessWidget {
  const LibraryScreenItem({super.key, required this.inscriptionsEntity});
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: Container(
            width: 141.w,
            height: 188.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
              color: Colors.white,
            ),
            child: LibraryScreenItemDetails(
              inscriptionsEntity: inscriptionsEntity,
            ),
          ),
        ),
        // Positioned(left: 13.w, top: 8.5.h, child: const CustomFavButton()),
      ],
    );
  }
}
