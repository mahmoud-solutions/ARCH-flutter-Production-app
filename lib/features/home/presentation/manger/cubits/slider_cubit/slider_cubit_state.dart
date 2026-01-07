part of 'slider_cubit_cubit.dart';

@immutable
sealed class SliderCubitState {}

final class SliderCubitInitial extends SliderCubitState {}

final class SliderCubitLoading extends SliderCubitState {}

final class SliderCubitLoaded extends SliderCubitState {
  final List<Sliderr> sliders;
  SliderCubitLoaded(this.sliders);
}

final class SliderCubitError extends SliderCubitState {
  final String message;
  SliderCubitError(this.message);
}
