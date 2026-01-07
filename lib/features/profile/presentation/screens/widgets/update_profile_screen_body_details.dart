import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreenBodyDetails extends StatelessWidget {
  const UpdateProfileScreenBodyDetails({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.networkImage,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final String? networkImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const CustomAppBar(title: 'تعديل الملف الشخصي'),
          SizedBox(height: 35.h),
          ProfileImage(
            pickedImage: context.watch<ProfileDataCubit>().pickedImage,
            networkImage: networkImage,
            onImagePicked: () {
              context.read<ProfileDataCubit>().pickProfileImage();
            },
          ),

          SizedBox(height: 35.h),

          CustomTextField(
            hintText: nameController.text,
            textFieldTitle: 'تعديل الاسم',
            controller: nameController,
          ),

          SizedBox(height: 20.h),

          CustomTextField(
            hintText: emailController.text,
            textFieldTitle: 'تعديل البريد الالكتروني',
            controller: emailController,
          ),

          SizedBox(height: 50.h),

          CustomButton(
            title: Text(
              'تعديل',
              style: AppTextStyles.syleNorsalMedium15(
                context,
              ).copyWith(color: Colors.white),
            ),
            buttonColor: AppColors.primary,
            onTap: () {
              context.read<ProfileDataCubit>().updateProfileData(
                name: nameController.text,
                email: emailController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
