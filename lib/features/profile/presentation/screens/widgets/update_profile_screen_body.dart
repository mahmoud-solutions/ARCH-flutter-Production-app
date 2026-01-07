import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/update_profile_screen_body_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreenBody extends StatefulWidget {
  const UpdateProfileScreenBody({super.key});

  @override
  State<UpdateProfileScreenBody> createState() =>
      _UpdateProfileScreenBodyState();
}

class _UpdateProfileScreenBodyState extends State<UpdateProfileScreenBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();

    context.read<ProfileDataCubit>().getProfileData();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataState>(
      listener: (context, state) {
        if (state is GetProfileDataSuccess) {
          nameController.text = state.profileData.userName;
          emailController.text = state.profileData.userEmail;
        }

        if (state is UpdateProfileDataSuccess) {
          customShowSnackBar(context, title: 'تم التعديل بنجاح');
          context.read<ProfileDataCubit>().getProfileData();
        }
      },
      builder: (context, state) {
        if (state is GetProfileDataLoading ||
            state is UpdateProfileDataLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is GetProfileDataFailure) {
          return CustomErrorWidget(
            errorMessage: 'حدث خطأ: ${state.errorMessage}',
          );
        } else if (state is UpdateProfileDataFailure) {
          return CustomErrorWidget(
            errorMessage: 'حدث خطأ: ${state.errorMessage}',
          );
        }

        return UpdateProfileScreenBodyDetails(
          nameController: nameController,
          emailController: emailController,
          networkImage: state is GetProfileDataSuccess
              ? state.profileData.userProfileImage
              : null,
        );
      },
    );
  }
}
