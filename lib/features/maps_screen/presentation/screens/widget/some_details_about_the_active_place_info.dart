import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/maps_screen/presentation/screens/widget/some_details_about_the_active_place_rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SomeDetailsAboutTheActivePlaceInfo extends StatelessWidget {
  const SomeDetailsAboutTheActivePlaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مدائن صالح',
          textAlign: TextAlign.right,
          style: AppTextStyles.syleNorsalMedium15(
            context,
          ).copyWith(color: const Color(0xFFD2B48C)),
        ),
        Row(
          spacing: 4,
          children: [
            Text(
              'السعوديه المدينة المنورة',
              textAlign: TextAlign.right,
              style: AppTextStyles.syleNorsalMedium12(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
            SvgPicture.asset(AppIcons.kLocatMarkerIcon),
          ],
        ),
        Text(
          'يبعد عن موقعك : 2.5 ساعة',
          textAlign: TextAlign.right,
          style: AppTextStyles.syleNorsalMedium12(
            context,
          ).copyWith(color: const Color(0xFF8A8A8A)),
        ),
        const SomeDetailsAboutTheActivePlaceRate(),
      ],
    );
  }
}
