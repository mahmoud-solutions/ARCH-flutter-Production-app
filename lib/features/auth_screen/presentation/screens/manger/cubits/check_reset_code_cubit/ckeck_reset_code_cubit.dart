import 'package:arch_team_power/features/auth_screen/domain/use_cases/check_reset_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ckeck_reset_code_state.dart';

class CkeckResetCodeCubit extends Cubit<CkeckResetCodeState> {
  CkeckResetCodeCubit(this.checkResetCodeUseCase)
    : super(CkeckResetCodeInitial());
  final CheckResetCodeUseCase checkResetCodeUseCase;
  Future<void> checkResetCode({
    required String email,
    required String code,
  }) async {
    emit(CkeckResetCodeLoading());
    final response = await checkResetCodeUseCase.call(email, code);
    response.fold(
      (failure) => emit(CkeckResetCodeFailure(errorMessage: failure.message)),
      (response) => emit(CkeckResetCodeSuccess()),
    );
  }
}
