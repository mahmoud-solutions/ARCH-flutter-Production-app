import 'package:arch_team_power/features/home/presentation/screens/widgets/famous_places_list.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostFamousPlacesWidget extends StatelessWidget {
  const MostFamousPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: const SectionTitle(title: "أكثر الأماكن المشهورة")
              .animate()
              .fade(duration: 600.ms)
              .slideY(begin: 0.3, duration: 600.ms),
        ),
        const FamousPlacesList()
            .animate()
            .fade(duration: 700.ms)
            .slideY(begin: 0.3, duration: 700.ms),
      ],
    );
  }
}
