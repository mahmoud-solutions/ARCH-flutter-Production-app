part of 'inscriptions_details_cubit.dart';

@immutable
sealed class InscriptionsDetailsState {}

final class InscriptionsDetailsInitial extends InscriptionsDetailsState {}

final class InscriptionsDetailsLoading extends InscriptionsDetailsState {}

final class InscriptionsDetailsSuccess extends InscriptionsDetailsState {
  final InscriptionsEntity inscriptionsDetails;

  InscriptionsDetailsSuccess({required this.inscriptionsDetails});
}

final class InscriptionsDetailsFailure extends InscriptionsDetailsState {
  final String errorMessage;

  InscriptionsDetailsFailure({required this.errorMessage});
}
