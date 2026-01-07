import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({
    super.key,
    this.onTap,
    required this.hintText,
    this.hintStyle,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines,
    this.height,
    this.width,
  });

  final Function()? onTap;
  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? readOnly;
  final int? maxLines;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 43.h,
      width: width ?? 230.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),
        color: Colors.white,
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                controller: controller,
                cursorColor: Colors.black,
                readOnly: readOnly ?? false,
                maxLines: maxLines,
                onTap: onTap,
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                  hintStyle:
                      hintStyle ??
                      TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Norsal',
                        color: const Color(0xffD0D0D0),
                        fontSize: 10.sp,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
