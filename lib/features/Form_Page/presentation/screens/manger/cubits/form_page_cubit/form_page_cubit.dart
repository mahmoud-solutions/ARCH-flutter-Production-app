import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_page_state.dart';

class FormPageCubit extends Cubit<FormPageState> {
  FormPageCubit() : super(FormPageInitial());
}
