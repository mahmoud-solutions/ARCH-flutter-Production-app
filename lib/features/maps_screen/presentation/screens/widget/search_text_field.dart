import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSrearchTextField extends StatelessWidget {
  const CustomSrearchTextField({
    super.key,
    this.canRequestFocus,
    this.onChanged,
    required this.hintText,
    this.hintStyle,
    this.controller,
    this.prefix,
    this.suffix,
  });

  final bool? canRequestFocus;
  final Function(String p1)? onChanged;
  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? prefix, suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),

      height: 39.h,
      width: 255.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: const Color(0xfff9f8f8),
        border: Border.all(color: const Color(0xffE6E2DF)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              controller: controller,
              cursorColor: Colors.black,
              canRequestFocus: canRequestFocus ?? true,
              onChanged: onChanged,
              style: AppTextStyles.syleNorsalMedium14(context),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: outLineInputBorderMethod(),
                focusedBorder: outLineInputBorderMethod(),
                hintText: hintText,
                prefixIcon: prefix,
                prefixIconColor: const Color(0xffD0D0D0),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 15.w,
                  maxHeight: 15.h,
                  minHeight: 15.h,
                  minWidth: 15.w,
                ),

                suffixIcon: suffix,
                suffixIconColor: Colors.black,
                suffixIconConstraints: BoxConstraints(
                  maxWidth: 15.w,
                  maxHeight: 15.h,
                  minHeight: 15.h,
                  minWidth: 15.w,
                ),

                hintStyle:
                    hintStyle ??
                    AppTextStyles.syleNorsalRegular10(
                      context,
                    ).copyWith(color: const Color(0xffD0D0D0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outLineInputBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Colors.transparent, width: 2),
    );
  }
}
