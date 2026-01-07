import 'package:arch_team_power/features/auth_screen/domain/use_cases/check_reset_code_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/resend_verify_code_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/send_verify_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required this.sendVerifyCodeUseCase,
    required this.resendVerifyCodeUseCase,
    required this.checkResetCodeUseCase,
  }) : super(ForgotPasswordInitial());
  final SendVerifyCodeUseCase sendVerifyCodeUseCase;
  final ResendVerifyCodeUseCase resendVerifyCodeUseCase;
  final CheckResetCodeUseCase checkResetCodeUseCase;
  String? _email;

  void setEmail(String email) {
    _email = email;
  }

  Future<void> sendVerifyCode({required String email}) async {
    emit(SendEmailVerifyCodeLoading());
    final response = await sendVerifyCodeUseCase.call(email);
    _email = email;
    response.fold(
      (failure) =>
          emit(SendEmailVerifyCodeFailure(errorMessage: failure.message)),
      (response) => emit(SendEmailVerifyCodeSuccess()),
    );
  }

  Future<void> resendVerifyCode() async {
    if (_email == null) {
      emit(ResendEmailVerifyCodeFailure(errorMessage: 'Email is missing'));
    }
    emit(ResendEmailVerifyCodeLoading());
    final response = await resendVerifyCodeUseCase.call(_email!);
    response.fold(
      (failure) =>
          emit(ResendEmailVerifyCodeFailure(errorMessage: failure.message)),
      (response) => emit(ResendEmailVerifyCodeSuccess()),
    );
  }

  Future<void> checkResetCode({required String code}) async {
    if (_email == null) {
      emit(CkeckResetCodeFailure(errorMessage: 'Email is missing'));
    }
    emit(CkeckResetCodeLoading());
    final response = await checkResetCodeUseCase.call(_email!, code);
    response.fold(
      (failure) => emit(CkeckResetCodeFailure(errorMessage: failure.message)),
      (response) => emit(CkeckResetCodeSuccess()),
    );
  }
}
