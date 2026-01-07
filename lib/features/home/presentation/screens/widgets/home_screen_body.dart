import 'package:arch_team_power/features/home/presentation/screens/widgets/archaeological_information_widget.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/home_header.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/inscriptions_library_widget.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/most_famous_places_widget.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(),
          Transform.translate(
            offset: Offset(0, -30.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderWidget(),
                    MostFamousPlacesWidget(),
                    InscriptionsLibraryWidget(),
                    ArchaeologicalInformationWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
