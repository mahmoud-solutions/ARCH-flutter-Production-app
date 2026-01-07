import 'package:arch_team_power/features/choseAppLang/presentation/screens/widget/lang_selector_expand.dart';
import 'package:arch_team_power/features/choseAppLang/presentation/screens/widget/lang_selector_fiald.dart';
import 'package:flutter/material.dart';

class LangSelector extends StatefulWidget {
  const LangSelector({super.key});

  @override
  State<LangSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LangSelector> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => setState(() => isOpen = !isOpen),
          child: LangSelectorFiald(isOpen: isOpen),
        ),

        if (isOpen) LangSelectorExpandFaild(isOpen: isOpen),
      ],
    );
  }
}
