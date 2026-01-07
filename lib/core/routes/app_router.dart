import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/Form_Page/form_page.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/notifications_page.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/payment_page.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/subscription_plans_screen.dart';
import 'package:arch_team_power/features/Search_Fliter/presentation/screens/search_fillter.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/forgot_password_view.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/login_screen.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/new_password_view.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/otp_view.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/register_screen.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/verify_email_view.dart';
import 'package:arch_team_power/features/choseAppLang/presentation/screens/chose_app_lang_screen.dart';
import 'package:arch_team_power/features/comments/presentation/comments_page.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/details_screen.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/inscription_details_screen.dart';
import 'package:arch_team_power/features/favorite_screen/domain/repo/favourite_repo.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/information/presentation/screens/information_screen.dart';
import 'package:arch_team_power/features/library/presentation/screens/library_screen.dart';
import 'package:arch_team_power/features/notes/presentation/screens/notes_screen.dart';
import 'package:arch_team_power/features/onboarding_screen/presentation/screens/intro_home_screen.dart';
import 'package:arch_team_power/features/option/presentation/screens/option_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/digital_library_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/events_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/faq_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/settings_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/subscription_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/vip_hall_screen.dart';
import 'package:arch_team_power/features/splash_screen/presentation/screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/layout/presentation/layout_page.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const kIntroHomeScreen = "/intro_home_screen";
  static const kLoginScreen = '/kloginscreen';
  static const kRegisterScreen = '/kregisterscreen';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kNewPasswordView = '/newPasswordView';
  static const kOtpView = '/otpView';
  static const kVerifyEmailView = '/verifyEmailView';
  static const kLangSelector = '/LangSelector';
  static const kOptionScreen = '/OptionScreen';
  static const kHomeScreen = "/home_screen";
  static const kFilterUI = '/FilterUI';
  static const kPaymentPage = '/PaymentPage';
  static const kMyFormPage = '/MyFormPage';
  static const kNotesScreen = '/NotesScreen';
  static const kInformationScreen = '/InformationScreen';
  static const kNotificationsPage = '/NotificationsPage';
  static const kDetailsScreen = '/DetailsScreen';
  static const kInscriptionDetailsScreen = '/InscriptionDetailsScreen';
  static const kSubscriptionPlansScreen = '/SubscriptionPlansScreen';
  static const kSettingsScreen = '/settingsscreen';
  static const kUpdateProfileScreen = '/UpdateProfileScreen';
  static const kFaqScreen = "/faq_screen";
  static const kDetailsLibraryScreen = "/digital_library_screen";
  static const kEventsScreen = "/events_screen";
  static const kVipHallScreen = "/vip_hall_screen";
  static const kSubscriptionScreen = "/subscriptionscreen";
  static const kComments = '/comments';
  static const kLibraryScreen = '/LibraryScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kIntroHomeScreen,
        builder: (context, state) => IntroHomeScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kLangSelector,
        builder: (context, state) => const ChoseAppLangScreen(),
      ),
      GoRoute(
        path: kOptionScreen,
        builder: (context, state) => const OptionScreen(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kVerifyEmailView,
        builder: (context, state) => const VerifyEmailView(),
      ),
      GoRoute(
        path: kOtpView,
        builder: (context, state) => OtpView(email: state.extra as String),
      ),
      GoRoute(
        path: kNewPasswordView,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<PostFavouriteCubit>(),
          child: const LayoutPage(),
        ),
      ),
      GoRoute(path: kFilterUI, builder: (context, state) => const FilterUI()),
      GoRoute(
        path: kMyFormPage,
        builder: (context, state) => const MyFormPage(),
      ),

      GoRoute(
        path: kNotificationsPage,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: AppRouter.kSettingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: kSubscriptionPlansScreen,
        builder: (context, state) => const SubscriptionPlansScreen(),
      ),
      GoRoute(
        path: kUpdateProfileScreen,
        builder: (context, state) => const UpdateProfileScreen(),
      ),
      GoRoute(
        path: kPaymentPage,
        builder: (context, state) => const PaymentPage(),
      ),
      GoRoute(
        path: kSubscriptionScreen,
        builder: (context, state) => SubscriptionScreen(),
      ),
      GoRoute(path: kFaqScreen, builder: (context, state) => const FaqScreen()),

      GoRoute(
        path: kDetailsLibraryScreen,
        builder: (context, state) => const DigitalLibraryScreen(),
      ),
      GoRoute(
        path: kDetailsScreen,
        builder: (context, state) =>
            DetailsScreen(subPlaceEntity: state.extra as SubPlaceEntity),
      ),
      GoRoute(
        path: kInscriptionDetailsScreen,
        builder: (context, state) => InscriptionDetailsScreen(
          inscriptionsEntity: state.extra as InscriptionsEntity,
        ),
      ),
      GoRoute(
        path: kEventsScreen,
        builder: (context, state) => const EventsScreen(),
      ),

      GoRoute(
        path: kVipHallScreen,
        builder: (context, state) => const VipHallScreen(),
      ),

      GoRoute(path: kComments, builder: (context, state) => CommentsPage()),
      GoRoute(
        path: kNotesScreen,
        builder: (context, state) => const NotesScreen(),
      ),
      GoRoute(
        path: kLibraryScreen,
        builder: (context, state) => const LibraryScreen(),
      ),
      GoRoute(
        path: kInformationScreen,
        builder: (context, state) => const InformationScreen(),
      ),
    ],
  );
}
