part of 'inscriptions_library_cubit.dart';

sealed class InscriptionsLibraryState {}

final class InscriptionsLibraryInitial extends InscriptionsLibraryState {}

final class InscriptionsLibraryLoading extends InscriptionsLibraryState {}

final class InscriptionsLibraryEmpty extends InscriptionsLibraryState {}

final class InscriptionsLibrarySuccess extends InscriptionsLibraryState {
  final List<InscriptionsEntity> inscriptionsLibrary;

  InscriptionsLibrarySuccess({required this.inscriptionsLibrary});
}

final class InscriptionsLibraryFailure extends InscriptionsLibraryState {
  final String errorMessage;

  InscriptionsLibraryFailure({required this.errorMessage});
}
