import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.canRequestFocus,
    this.obscureText,
    this.validator,
    this.onChanged,
    required this.hintText,
    this.hintStyle,
    this.textFieldTitle,
    this.controller,
    this.showEyeIcon = false,
    this.textAlign,
    this.heightTextfield,
    this.fontSizeTextFieldTitle,
    this.fontSizeHintText,
    this.contentPadding,
    this.colorHintText,
    this.keyboardType,
  });

  final bool? canRequestFocus;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String p1)? onChanged;
  final String? hintText, textFieldTitle;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final bool showEyeIcon;
  final TextAlign? textAlign;
  final double? heightTextfield;
  final double? fontSizeTextFieldTitle;
  final double? fontSizeHintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? colorHintText;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText ?? false;
  }

  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.textFieldTitle ?? '',
              style: AppTextStyles.syleNorsalMedium14(
                context,
              ).copyWith(fontSize: widget.fontSizeTextFieldTitle),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: widget.heightTextfield,
              width: 297.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: const Color(0xfff9f8f8),
                border: Border.all(
                  color: fieldState.hasError
                      ? Colors.red
                      : const Color(0xffE6E2DF),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: widget.keyboardType,
                      textAlign: widget.textAlign ?? TextAlign.start,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: widget.controller,
                      cursorColor: Colors.black,
                      canRequestFocus: widget.canRequestFocus ?? true,
                      obscureText: obscureText,
                      onChanged: (value) {
                        widget.onChanged?.call(value);
                        fieldState.didChange(value);
                      },
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      decoration: InputDecoration(
                        contentPadding: widget.contentPadding,
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle:
                            widget.hintStyle ??
                            AppTextStyles.syleNorsalRegular10(context).copyWith(
                              color:
                                  widget.colorHintText ??
                                  const Color(0xFF8A8A8A),
                              fontSize: widget.fontSizeHintText,
                            ),
                      ),
                    ),
                  ),
                  if (widget.showEyeIcon)
                    SizedBox(
                      width: 40.w,
                      child: IconButton(
                        icon: Icon(
                          obscureText
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: const Color(0xffD0D0D0),
                        ),
                        onPressed: toggleObscure,
                      ),
                    ),
                ],
              ),
            ),
            if (fieldState.hasError)
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Text(
                  fieldState.errorText ?? '',
                  style: TextStyle(color: Colors.red, fontSize: 14.sp),
                ),
              ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
