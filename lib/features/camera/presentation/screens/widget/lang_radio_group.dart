import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/open_lang_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangRadioGroup extends StatefulWidget {
  const LangRadioGroup({
    super.key,
    required this.initialLang,
    required this.languages,
  });

  final String initialLang;
  final List<LanguageOption> languages;

  @override
  State<LangRadioGroup> createState() => _LangRadioGroupState();
}

class _LangRadioGroupState extends State<LangRadioGroup> {
  late String selectedLang;

  @override
  void initState() {
    super.initState();
    selectedLang = widget.initialLang;
  }

  void onLangSelected(String code) {
    setState(() {
      selectedLang = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.languages.length,
        itemBuilder: (context, index) {
          final lang = widget.languages[index];
          return InkWell(
            onTap: () => onLangSelected(lang.code),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Radio<String>(
                    value: lang.code,
                    groupValue: selectedLang,
                    onChanged: (v) {
                      if (v != null) onLangSelected(v);
                    },
                    activeColor: const Color(0xffD2B48C),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      lang.name,
                      style: AppTextStyles.syleNorsalMedium17(context),
                    ),
                  ),
                  Image.asset(lang.flag, width: 25.w, height: 25.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
