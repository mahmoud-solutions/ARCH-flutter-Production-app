part of 'search_filter_cubit.dart';

@immutable
sealed class SearchFilterState {}

final class SearchFilterInitial extends SearchFilterState {}

final class SearchFilterLoading extends SearchFilterState {}

final class SearchFilterSuccess extends SearchFilterState {}

final class SearchFilterFailure extends SearchFilterState {
  final String errorMessage;

  SearchFilterFailure({required this.errorMessage});
}
