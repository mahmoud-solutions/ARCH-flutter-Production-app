import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitial());
}
