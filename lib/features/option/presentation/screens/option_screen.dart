import 'package:arch_team_power/features/option/presentation/screens/widget/option_screen_body.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: OptionScreenBody(),
      ),
    );
  }
}
