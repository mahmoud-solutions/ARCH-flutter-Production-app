import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_remote_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/repos_impl/auth_repo_impl.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/signup_use_case.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/social_auth_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff9f8f8),
        body: BlocProvider(
          create: (context) => SignUpCubit(
            SignupUseCase(
              AuthRepoImpl(
                remoteDataSource: AuthRemoteDataSourceImpl(ApiService(Dio())),
                localDataSource: AuthLocalDataSourceImpl(),
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 13.86.w,
                vertical: 28.h,
              ),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'إنشاء حساب',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.syleNorsalMedium17(context),
                        ),
                        SizedBox(height: 34.h),
                        CustomTextField(
                          controller: _emailController,
                          textFieldTitle: 'البريد الإلكتروني',
                          hintText: 'ادخل البريد الإلكتروني',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "حقل مطلوب";
                            if (!value!.contains('@')) {
                              return "بريد إلكتروني غير صالح";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: _passwordController,
                          textFieldTitle: 'كلمة المرور',
                          hintText: 'كلمة المرور',
                          obscureText: true,
                          showEyeIcon: true,
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "حقل مطلوب";
                            if (value!.length < 6) {
                              return "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: _confirmPasswordController,
                          textFieldTitle: 'تأكيد كلمة المرور',
                          hintText: 'أعد كتابة كلمة المرور',
                          obscureText: true,
                          showEyeIcon: true,
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "حقل مطلوب";
                            if (value != _passwordController.text) {
                              return "كلمتا المرور غير متطابقتين";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Checkbox(value: false, onChanged: null),
                                Text(
                                  'أوافق علي الشروط والأحكام',
                                  style: AppTextStyles.syleNorsalRegular10(
                                    context,
                                  ).copyWith(color: const Color(0xAB282828)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 49.h),
                        BlocConsumer<SignUpCubit, SignUpState>(
                          listener: (context, state) {
                            if (state is SignUpSuccess) {
                              GoRouter.of(context).go(AppRouter.kHomeScreen);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('تم انشاء الحساب بنجاح'),
                                ),
                              );
                            } else if (state is SignUpFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              onTap: state is SignUpLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<SignUpCubit>().signUp(
                                          name: 'mohammed',
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                        );
                                      }
                                    },
                              title: state is SignUpLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'إنشاء حساب',
                                      style: AppTextStyles.syleNorsalMedium15(
                                        context,
                                      ).copyWith(color: Colors.white),
                                    ),
                              buttonColor: const Color(0xffD2B48C),
                            );
                          },
                        ),

                        SizedBox(height: 21.h),
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                'أو',
                                style: AppTextStyles.syleNorsalRegular14(
                                  context,
                                ),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SocialAuthItem(
                              assetName: AppIcons.kGoogleIcon,
                            ),
                            SizedBox(width: 11.w),
                            const SocialAuthItem(
                              assetName: AppIcons.kFaceBookIcon,
                            ),
                            SizedBox(width: 11.w),
                            const SocialAuthItem(
                              assetName: AppIcons.kAppleIcon,
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'لديك حساب ؟ ',
                              style: AppTextStyles.syleNorsalRegular14(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).pushReplacement(AppRouter.kLoginScreen);
                              },
                              child: Text(
                                ' تسجيل دخول',
                                style: AppTextStyles.syleNorsalRegular14(
                                  context,
                                ).copyWith(color: const Color(0xffD2B48C)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
