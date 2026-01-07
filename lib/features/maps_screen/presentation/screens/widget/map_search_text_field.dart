import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapSearchTextField extends StatelessWidget {
  const MapSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 20.w,
      right: 20.w,
      child: CustomSrearchTextField(
        hintText: 'ابحث عن اماكن اثريه....',
        prefix: SvgPicture.asset(AppIcons.kLocatMarkerIcon),
        suffix: const Icon(CupertinoIcons.search),
      ),
    );
  }
}
