import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  Color borderColor = const Color(0xffE6E2DF);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        borderColor = widget.controller.text.isNotEmpty
            ? const Color(0xffD2B48C)
            : const Color(0xffE6E2DF);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59.h,
      width: 40.w,
      child: TextFormField(
        controller: widget.controller,
        textDirection: TextDirection.ltr,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff9f8f8),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: borderColor),
          ),
        ),
      ),
    );
  }
}
