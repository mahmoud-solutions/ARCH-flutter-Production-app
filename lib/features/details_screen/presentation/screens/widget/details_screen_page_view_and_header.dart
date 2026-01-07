import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_page_view.dart';
import 'package:arch_team_power/core/widgets/custom_fav_button.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailsScreenPageViewAndHeader extends StatelessWidget {
  const DetailsScreenPageViewAndHeader({
    super.key,
    required this.subPlaceEntity,
  });
  final SubPlaceEntity subPlaceEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsPageView(subPlaceEntity: subPlaceEntity),

        Positioned(
          top: 35.h,
          left: 14.h,
          right: 14.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 23.sp,
                ),
              ),
              // const CustomFavButton(),
            ],
          ),
        ),
      ],
    );
  }
}
