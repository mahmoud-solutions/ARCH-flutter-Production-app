part of 'pobular_cubit.dart';

@immutable
sealed class PobularState {}

final class PobularInitial extends PobularState {}

final class PobularLoading extends PobularState {}

final class PobularError extends PobularState {
  final String message;
  PobularError(this.message);
}

final class PobularLoaded extends PobularState {
  final List<PopularPlace> popularPlaces;
  PobularLoaded(this.popularPlaces);
}
