import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/update_profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.86.w),
          child: BlocProvider(
            create: (context) => sl<ProfileDataCubit>(),
            child: const UpdateProfileScreenBody(),
          ),
        ),
      ),
    );
  }
}
