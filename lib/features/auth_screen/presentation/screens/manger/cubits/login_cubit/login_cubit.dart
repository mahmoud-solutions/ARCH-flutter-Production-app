import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase(email, password);

    result.fold((failure) {
      emit(LoginFailure(errorMessage: failure.message));
    }, (user) => emit(LoginSuccess(userEntity: user)));
  }
}
