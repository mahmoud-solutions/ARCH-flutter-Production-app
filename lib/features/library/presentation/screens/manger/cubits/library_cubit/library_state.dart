part of 'library_cubit.dart';

@immutable
sealed class LibraryState {}

final class LibraryInitial extends LibraryState {}

final class LibraryLoading extends LibraryState {}

final class LibrarySuccess extends LibraryState {}

final class LibraryFailure extends LibraryState {
  final String errorMessage;

  LibraryFailure({required this.errorMessage});
}
