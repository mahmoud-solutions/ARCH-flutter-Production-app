part of 'ckeck_reset_code_cubit.dart';

@immutable
sealed class CkeckResetCodeState {}

final class CkeckResetCodeInitial extends CkeckResetCodeState {}

final class CkeckResetCodeLoading extends CkeckResetCodeState {}

final class CkeckResetCodeSuccess extends CkeckResetCodeState {}

final class CkeckResetCodeFailure extends CkeckResetCodeState {
  final String errorMessage;

  CkeckResetCodeFailure({required this.errorMessage});
}
