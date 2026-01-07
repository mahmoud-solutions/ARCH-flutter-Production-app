import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_remote_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/repos_impl/auth_repo_impl.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/login_use_case.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff9f8f8),
        body: BlocProvider(
          create: (context) => LoginCubit(
            LoginUseCase(
              AuthRepoImpl(
                remoteDataSource: AuthRemoteDataSourceImpl(ApiService(Dio())),
                localDataSource: AuthLocalDataSourceImpl(),
              ),
            ),
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.86.w,
                  vertical: 28.h,
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'تسجيل الدخول',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.syleNorsalMedium17(context),
                        ),
                        const SizedBox(height: 48.0),
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

                        const SizedBox(height: 16.0),
                        CustomTextField(
                          controller: _passwordController,
                          textFieldTitle: 'كلمة المرور',
                          hintText: 'كلمة المرور',
                          obscureText: true,
                          showEyeIcon: true,
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "حقل مطلوب";
                            if (value!.length < 6) {
                              return "كلمة المرور قصيرة جداً";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 8.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Checkbox(value: false, onChanged: null),
                                Text(
                                  'تذكرني',
                                  style: AppTextStyles.syleNorsalRegular10(
                                    context,
                                  ).copyWith(color: const Color(0xAB282828)),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.kForgotPasswordView);
                              },
                              child: Text(
                                'هل نسيت كلمة المرور؟',
                                style: AppTextStyles.syleNorsalRegular10(
                                  context,
                                ).copyWith(color: const Color(0xFFD2B48C)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 48.h),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              GoRouter.of(context).go(AppRouter.kHomeScreen);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('تم تسجيل الدخول بنجاح'),
                                ),
                              );
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              onTap: state is LoginLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginCubit>().logIn(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                        );
                                      }
                                    },
                              title: state is LoginLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'تسجيل الدخول',
                                      style: AppTextStyles.syleNorsalMedium15(
                                        context,
                                      ).copyWith(color: Colors.white),
                                    ),
                              buttonColor: const Color(0xffD2B48C),
                            );
                          },
                        ),

                        SizedBox(height: 138.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب؟ ',
                              style: AppTextStyles.syleNorsalRegular14(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.kRegisterScreen);
                              },
                              child: Text(
                                'إنشاء حساب',
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
