import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final localDataSource = sl<AuthLocalDataSource>();

    final isFirstTime = await localDataSource.isFirstTime();

    if (isFirstTime) {
      GoRouter.of(context).go(AppRouter.kIntroHomeScreen);
      return;
    }

    final isLoggedIn = await localDataSource.isLoggedIn();

    if (isLoggedIn) {
      GoRouter.of(context).go(AppRouter.kHomeScreen);
    } else {
      GoRouter.of(context).go(AppRouter.kLoginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/spash_image.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
