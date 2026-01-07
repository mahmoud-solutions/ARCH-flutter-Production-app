import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/log_out_cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomLogOutShowModelBottomShettDetails extends StatelessWidget {
  const CustomLogOutShowModelBottomShettDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<LogOutCubit, LogOutState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          isLoading = false;
          GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
        } else if (state is LogOutLoading) {
          isLoading = true;
        } else if (state is LogOutFailure) {
          isLoading = false;
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            width: double.infinity,
            height: 150.h,
            child: Column(
              children: [
                SizedBox(height: 35.h),
                Text(
                  'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
                  style: AppTextStyles.syleNorsalMedium17(context),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomButton(
                      onTap: () => GoRouter.of(context).pop(),
                      width: 70.w,
                      title: Text(
                        'الغاء',
                        style: AppTextStyles.syleNorsalMedium14(context),
                      ),
                      buttonColor: AppColors.surface,
                    ),
                    const Spacer(),
                    CustomButton(
                      onTap: () {
                        context.read<LogOutCubit>().logout();
                      },
                      width: 70.w,
                      title: isLoading
                          ? const CustomCircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'تأكيد',
                              style: AppTextStyles.syleNorsalMedium14(context),
                            ),
                      buttonColor: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
