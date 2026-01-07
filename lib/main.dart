import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/choseAppLang/presentation/screens/manger/cubit/locale_cubit/locale_cubit.dart';
import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AndroidGoogleMapsFlutter.useAndroidViewSurface = true;

  await initServiceLocator();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => BlocProvider(
        create: (context) => LocaleCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(324.77, 674.65),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              locale: locale,
              useInheritedMediaQuery: true, // مهم مع DevicePreview
              builder: DevicePreview.appBuilder, // مهم جداً مع DevicePreview
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: AppRouter.router,
            );
          },
        );
      },
    );
  }
}

// الكود دا تبعي بشغلله عندي محدش يمسحه او يعدل عليه حاجه
// import 'package:arch_team_power/core/routes/app_router.dart';
// import 'package:arch_team_power/features/Form_Page/form_page.dart';
// import 'package:arch_team_power/features/Notifications/presentation/screens/notifications_page.dart';
// import 'package:arch_team_power/features/Payment_Methods/payment_page.dart';
// import 'package:arch_team_power/features/auth_screen/presentation/screens/login_screen.dart';
// import 'package:arch_team_power/features/comments/presentation/comments_page.dart';
// import 'package:arch_team_power/l10n/app_localizations.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() {
//   runApp(DevicePreview(enabled: true, builder: (context) => const MyTestApp()));
// }

// class MyTestApp extends StatelessWidget {
//   const MyTestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(324.77, 674.65),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           useInheritedMediaQuery: true,
//           debugShowCheckedModeBanner: false,
//           locale: DevicePreview.locale(context),

//           // DevicePreview builder
//           builder: DevicePreview.appBuilder,

//           localizationsDelegates: const [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: AppLocalizations.supportedLocales,

//           // Home Page (زي ما انت عايز)
//           home: PaymentPage(),
//         );
//       },
//     );
//   }
// }
