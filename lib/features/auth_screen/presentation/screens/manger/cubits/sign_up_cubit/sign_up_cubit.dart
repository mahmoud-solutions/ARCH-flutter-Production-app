import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/signup_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signupUseCase) : super(SignUpInitial());
  final SignupUseCase signupUseCase;
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await signupUseCase(name, email, password);

    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
