import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/home_screen_profile_image.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.nameColor, this.roleColor});
  final Color? nameColor, roleColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        if (state is GetProfileDataSuccess) {
          return Row(
            children: [
              HomeScreenProfileImage(
                networkImage: state.profileData.userProfileImage,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.profileData.userName,
                    style: AppTextStyles.syleNorsalRegular14(
                      context,
                    ).copyWith(color: nameColor ?? Colors.black),
                  ),
                  Text(
                    "سائح",
                    style: AppTextStyles.syleNorsalRegular10(
                      context,
                    ).copyWith(color: roleColor ?? const Color(0xFF8A8A8A)),
                  ),
                ],
              ),
            ],
          );
        } else if (state is GetProfileDataFailure) {
          return Text(
            "حدث خطأ: ${state.errorMessage}",
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: Colors.red),
          );
        }
        return SizedBox(
          height: 56.h,
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xffD2B48C)),
          ),
        );
      },
    );
  }
}
