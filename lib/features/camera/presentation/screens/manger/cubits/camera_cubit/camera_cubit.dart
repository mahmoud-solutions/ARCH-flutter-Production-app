import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());
}
