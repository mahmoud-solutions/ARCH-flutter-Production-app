import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/library/presentation/screens/widget/library_screen_sliver_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreenBody extends StatelessWidget {
  const LibraryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const CustomAppBar(title: 'مكتبة النقوش الاثريه'),
              SizedBox(height: 35.h),
              Column(
                children: [
                  const LibraryScreenSliverGridView(),
                  SizedBox(height: 55.h),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
