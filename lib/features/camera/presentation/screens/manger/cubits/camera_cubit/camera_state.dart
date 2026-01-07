part of 'camera_cubit.dart';

@immutable
sealed class CameraState {}

final class CameraInitial extends CameraState {}

final class CameraLoading extends CameraState {}

final class CameraSuccess extends CameraState {}

final class CameraFailure extends CameraState {
  final String errorMessage;

  CameraFailure({required this.errorMessage});
}
