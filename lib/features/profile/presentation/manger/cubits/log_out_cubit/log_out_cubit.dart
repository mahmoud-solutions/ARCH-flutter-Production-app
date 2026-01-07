import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/profile/domain/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit({required this.authLocalDataSource, required this.profilerepo})
    : super(LogOutInitial());
  final ProfileRepo profilerepo;
  final AuthLocalDataSource authLocalDataSource;
  Future<void> logout() async {
    emit(LogOutLoading());
    final response = await profilerepo.logout();
    response.fold(
      (failure) => emit(LogOutFailure(errorMessage: failure.message)),
      (response) async {
        await authLocalDataSource.clearToken();
        emit(LogOutSuccess());
      },
    );
  }
}
