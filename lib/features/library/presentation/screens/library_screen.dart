import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:arch_team_power/features/library/presentation/screens/widget/library_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InscriptionsLibraryCubit>()..getInscriptions(),
      child: Scaffold(
        backgroundColor: const Color(0xfff9f8f8),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.86.w),
            child: const LibraryScreenBody(),
          ),
        ),
      ),
    );
  }
}
