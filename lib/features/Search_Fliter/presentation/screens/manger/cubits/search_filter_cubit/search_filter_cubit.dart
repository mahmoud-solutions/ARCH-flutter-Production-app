import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  SearchFilterCubit() : super(SearchFilterInitial());
}
