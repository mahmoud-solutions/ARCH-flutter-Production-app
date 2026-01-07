import 'package:arch_team_power/features/home/presentation/screens/widgets/home_search_filter_widget.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/home_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HomeSearchTextField(),
        SizedBox(width: 12.w),
        const SearchFilterWidget(),
      ],
    );
  }
}
