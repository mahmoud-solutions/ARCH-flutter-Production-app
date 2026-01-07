part of 'sub_places_cubit.dart';

@immutable
sealed class SubPlacesState {}

final class SubPlacesInitial extends SubPlacesState {}

final class SubPlacesLoading extends SubPlacesState {}

final class SubPlacesEmpty extends SubPlacesState {}

final class SubPlacesSuccess extends SubPlacesState {
  final List<SubPlaceEntity> subPlaces;

  SubPlacesSuccess({required this.subPlaces});
}

final class SubPlacesFailure extends SubPlacesState {
  final String errorMessage;

  SubPlacesFailure({required this.errorMessage});
}
