part of 'information_cubit.dart';

@immutable
sealed class InformationState {}

final class InformationInitial extends InformationState {}

final class InformationLoading extends InformationState {}

final class InformationSuccess extends InformationState {}

final class InformationFailure extends InformationState {
  final String errorMessage;

  InformationFailure({required this.errorMessage});
}
