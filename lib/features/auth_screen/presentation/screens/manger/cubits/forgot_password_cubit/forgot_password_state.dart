part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class SendEmailVerifyCodeLoading extends ForgotPasswordState {}

final class SendEmailVerifyCodeSuccess extends ForgotPasswordState {}

final class SendEmailVerifyCodeFailure extends ForgotPasswordState {
  final String errorMessage;

  SendEmailVerifyCodeFailure({required this.errorMessage});
}

final class ResendEmailVerifyCodeLoading extends ForgotPasswordState {}

final class ResendEmailVerifyCodeSuccess extends ForgotPasswordState {}

final class ResendEmailVerifyCodeFailure extends ForgotPasswordState {
  final String errorMessage;

  ResendEmailVerifyCodeFailure({required this.errorMessage});
}

final class CkeckResetCodeLoading extends ForgotPasswordState {}

final class CkeckResetCodeSuccess extends ForgotPasswordState {}

final class CkeckResetCodeFailure extends ForgotPasswordState {
  final String errorMessage;

  CkeckResetCodeFailure({required this.errorMessage});
}
