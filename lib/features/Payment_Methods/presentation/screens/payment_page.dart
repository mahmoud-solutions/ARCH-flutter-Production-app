import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/card_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 34.h),
              const CustomAppBar(title: 'وسائل الدفع'),
              SizedBox(height: 34.h),
              Text(
                'اختر الطريقة التي تفضلها لاستكمال طريقة الدفع',
                style: AppTextStyles.syleNorsalMedium15(
                  context,
                ).copyWith(fontSize: 13.sp, letterSpacing: 1),
              ),

              const SizedBox(height: 30),

              CardPaymentButton(
                width: width,
                onTap: () {
                  debugPrint('MasterCard button tapped');
                },
                onIconTap: () {
                  debugPrint('MasterCard icon tapped');
                },
                bankImageUrl: 'assets/icons/mastercard_icon.svg',
                lastDigits: '123',
                label: 'MasterCard',
              ),

              const SizedBox(height: 20),

              CardPaymentButton(
                width: width,
                onTap: () {
                  debugPrint('Visa button tapped');
                },
                onIconTap: () {
                  debugPrint('Visa icon tapped');
                },
                bankImageUrl: 'assets/icons/visa_icon.svg',
                lastDigits: '789',
                label: 'Visa',
              ),
              SizedBox(height: 90.h),
              CustomButton(
                onTap: () => GoRouter.of(context).push(AppRouter.kMyFormPage),
                title: Text(
                  'تأكيد ',
                  style: AppTextStyles.syleNorsalMedium15(
                    context,
                  ).copyWith(color: Colors.white),
                ),

                buttonColor: const Color(0xFFD2B48C),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
