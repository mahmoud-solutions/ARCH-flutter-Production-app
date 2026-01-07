import 'package:arch_team_power/features/choseAppLang/presentation/screens/manger/cubit/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangSelectorExpandFaild extends StatefulWidget {
  const LangSelectorExpandFaild({super.key, this.isOpen = false});
  final bool? isOpen;
  @override
  State<LangSelectorExpandFaild> createState() =>
      _LangSelectorExpandFaildState();
}

class _LangSelectorExpandFaildState extends State<LangSelectorExpandFaild> {
  final List<Map<String, dynamic>> languages = [
    {"name": "English", "locale": const Locale('en'), "flag": "🇬🇧"},
    {"name": "اللغة العربية", "locale": const Locale('ar'), "flag": "🇸🇦"},
  ];
  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;

    return Container(
      width: 297.w,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: languages.map((lang) {
          final bool selected =
              lang["locale"].languageCode == currentLocale.languageCode;

          return GestureDetector(
            onTap: () {
              context.read<LocaleCubit>().changeLocale(lang["locale"]);
              setState(() => widget.isOpen);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: selected ? Colors.grey.shade200 : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(lang["flag"], style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Text(lang["name"], style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
