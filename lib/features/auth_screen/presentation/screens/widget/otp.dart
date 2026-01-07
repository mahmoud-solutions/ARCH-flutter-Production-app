import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/otp_field.dart';
import 'package:flutter/cupertino.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => OtpState();
}

class OtpState extends State<Otp> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (code) => TextEditingController(),
  );

  String getOtpCode() {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            6,
            (index) => OtpField(controller: controllers[index]),
          ),
        ),
      ),
    );
  }
}
