import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/features/maps_screen/presentation/models/map_place_model.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/some_details_about_the_active_place_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SomeDetailsAboutTheActivePlace extends StatelessWidget {
  const SomeDetailsAboutTheActivePlace({
    super.key,
    required this.onTap,
    required this.place,
  });
  final MapPlaceModel place;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 112.h,
          width: 248.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SomeDetailsAboutTheActivePlaceInfo(),
                Container(
                  width: 91.w,
                  height: 88.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.kMdaenImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
