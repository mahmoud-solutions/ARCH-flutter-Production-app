part of 'sub_places_details_cubit.dart';

@immutable
sealed class SubPlacesDetailsState {}

final class SubPlacesDetailsInitial extends SubPlacesDetailsState {}

final class SubPlacesDetailsLoading extends SubPlacesDetailsState {}

final class SubPlacesDetailsSuccess extends SubPlacesDetailsState {
  final SubPlaceEntity subPlaceEntity;

  SubPlacesDetailsSuccess({required this.subPlaceEntity});
}

final class SubPlacesDetailsFailure extends SubPlacesDetailsState {
  final String errorMessage;

  SubPlacesDetailsFailure({required this.errorMessage});
}
