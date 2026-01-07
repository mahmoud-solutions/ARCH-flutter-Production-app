part of 'form_page_cubit.dart';

@immutable
sealed class FormPageState {}

final class FormPageInitial extends FormPageState {}

final class FormPageLoading extends FormPageState {}

final class FormPageSuccess extends FormPageState {}

final class FormPageFailure extends FormPageState {
  final String errorMessage;

  FormPageFailure({required this.errorMessage});
}
