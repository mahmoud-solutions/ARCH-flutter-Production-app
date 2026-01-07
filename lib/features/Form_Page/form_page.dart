import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/features/Form_Page/presentation/screens/manger/cubits/form_page_cubit/form_page_cubit.dart';
import 'package:arch_team_power/features/Form_Page/widgets/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFormPage extends StatelessWidget {
  const MyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sampleImages = [
      'https://picsum.photos/800/400?image=10',
      'https://picsum.photos/800/400?image=20',
      'https://picsum.photos/800/400?image=30',
    ];

    return BlocProvider(
      create: (context) => FormPageCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: const Text(
            'البطاقه الخاصه بي',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const CardSliderWidget(
                      images: ["assets/image/cardvisa.png"],
                    ),

                    const SizedBox(height: 19),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sampleImages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black26),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomTextField(
                    heightTextfield: 64,
                    textAlign: TextAlign.right,
                    hintText: "محمد الزهراني",
                    textFieldTitle: "الاسم الثنائي :",
                    fontSizeTextFieldTitle: 25,
                    fontSizeHintText: 25,
                    colorHintText: AppColors.unSelectItemSelectedColor,

                    contentPadding: EdgeInsets.only(right: 20),
                  ),
                ),

                const SizedBox(height: 10),
                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomTextField(
                    heightTextfield: 64,
                    hintText: "1267  2312  0918  2344",
                    textFieldTitle: "رقم البطاقه :",
                    fontSizeTextFieldTitle: 25,
                    fontSizeHintText: 25,
                    contentPadding: EdgeInsets.only(right: 200),
                    colorHintText: AppColors.unSelectItemSelectedColor,
                  ),
                ),

                const SizedBox(height: 16),

                // ========== العنصر الرابع: Row فيه 2 TextField نص الشاشة ==========
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        heightTextfield: 64,
                        textAlign: TextAlign.right,
                        hintText: "****",
                        textFieldTitle: "cvv :",
                        fontSizeTextFieldTitle: 25,
                        fontSizeHintText: 25,
                        contentPadding: EdgeInsets.only(right: 100),
                        obscureText: true,
                        colorHintText: AppColors.unSelectItemSelectedColor,
                      ),
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomTextField(
                          heightTextfield: 64,
                          textAlign: TextAlign.right,
                          hintText: "02/2028",
                          textFieldTitle: "تاريخ الانتهاء :",
                          fontSizeTextFieldTitle: 25,
                          fontSizeHintText: 25,
                          contentPadding: EdgeInsets.only(right: 80),
                          colorHintText: AppColors.unSelectItemSelectedColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ========== العنصر الخامس: Button ==========
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Confirm pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'تأكيد',
                      style: AppTextStyles.syleNorsalMedium15(context).copyWith(
                        fontSize: 8.sp,
                        letterSpacing: 1,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
