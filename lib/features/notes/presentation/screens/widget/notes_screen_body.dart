import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/notes_screen_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesScreenBody extends StatelessWidget {
  const NotesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const CustomAppBar(title: 'الملاحظات'),
        SizedBox(height: 20.h),
        const NotesScreenBlocBuilder(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
