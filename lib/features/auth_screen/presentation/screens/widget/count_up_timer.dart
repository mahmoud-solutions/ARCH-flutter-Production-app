import 'dart:async';

import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class CountUpTimer extends StatefulWidget {
  const CountUpTimer({super.key});

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  int totalSeconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        totalSeconds++;
      });
    });
  }

  String get timeString {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timeString, style: AppTextStyles.syleNorsalRegular14(context));
  }
}
