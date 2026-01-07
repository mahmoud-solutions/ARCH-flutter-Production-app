import 'package:arch_team_power/features/camera/presentation/screens/manger/cubits/camera_cubit/camera_cubit.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/camera_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F2EF),
        body: BlocProvider(
          create: (context) => CameraCubit(),
          child: const CameraScreenBody(),
        ),
      ),
    );
  }
}
