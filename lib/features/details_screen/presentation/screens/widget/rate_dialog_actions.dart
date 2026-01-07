import 'package:arch_team_power/features/details_screen/presentation/screens/widget/dialog_action_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateDialogActions extends StatelessWidget {
  const RateDialogActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const DialogActionContainer(
          color: Color(0xffD2B48C),
          title: 'تأكيد',
          textColor: Colors.white,
        ),
        SizedBox(width: 10.w),
        const DialogActionContainer(
          color: Color(0xFFD0D0D0),
          title: 'الغاء',
          textColor: Colors.black,
        ),
      ],
    );
  }
}
