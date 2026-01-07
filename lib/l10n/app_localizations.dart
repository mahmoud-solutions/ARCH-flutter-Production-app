import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @forgot_password_appbar_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot my password'**
  String get forgot_password_appbar_title;

  /// No description provided for @forgot_password_text_field_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get forgot_password_text_field_hint;

  /// No description provided for @forgot_password_text_field_title.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forgot_password_text_field_title;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get send_code;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @enter_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enter_new_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @code_verification.
  ///
  /// In en, this message translates to:
  /// **'Code verification'**
  String get code_verification;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get didnt_receive_code;

  /// No description provided for @resend_it.
  ///
  /// In en, this message translates to:
  /// **'Resend it'**
  String get resend_it;

  /// No description provided for @check_email.
  ///
  /// In en, this message translates to:
  /// **'Check email'**
  String get check_email;

  /// No description provided for @password_recovery.
  ///
  /// In en, this message translates to:
  /// **'A password recovery code has been sent to your email address.'**
  String get password_recovery;

  /// No description provided for @check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get check_your_email;

  /// No description provided for @password_has_been_changed.
  ///
  /// In en, this message translates to:
  /// **'Password has been changed'**
  String get password_has_been_changed;

  /// No description provided for @your_password_has_been_successfully_changed.
  ///
  /// In en, this message translates to:
  /// **'Your password has been successfully changed.'**
  String get your_password_has_been_successfully_changed;

  /// No description provided for @confirm_code.
  ///
  /// In en, this message translates to:
  /// **'Confirm code'**
  String get confirm_code;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'rate'**
  String get rate;

  /// No description provided for @similar_places_near_you.
  ///
  /// In en, this message translates to:
  /// **'Similar places near you'**
  String get similar_places_near_you;

  /// No description provided for @the_kings_valley.
  ///
  /// In en, this message translates to:
  /// **'The Kings Valley'**
  String get the_kings_valley;

  /// No description provided for @did_you_like_the_engraving.
  ///
  /// In en, this message translates to:
  /// **'Did you like the engraving?'**
  String get did_you_like_the_engraving;

  /// No description provided for @rate_the_engraving.
  ///
  /// In en, this message translates to:
  /// **'Please rate the engraving so others can see it.'**
  String get rate_the_engraving;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'status:'**
  String get status;

  /// No description provided for @not_clear.
  ///
  /// In en, this message translates to:
  /// **'not clear'**
  String get not_clear;

  /// No description provided for @date_of_discovery_of_the_inscription.
  ///
  /// In en, this message translates to:
  /// **'Date of discovery of the inscription :'**
  String get date_of_discovery_of_the_inscription;

  /// No description provided for @details_of_finding_the_inscription.
  ///
  /// In en, this message translates to:
  /// **'Details of finding the inscription:'**
  String get details_of_finding_the_inscription;

  /// No description provided for @translation_of_the_inscription.
  ///
  /// In en, this message translates to:
  /// **'Translation of the inscription:'**
  String get translation_of_the_inscription;

  /// No description provided for @closed_now.
  ///
  /// In en, this message translates to:
  /// **'closed now'**
  String get closed_now;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @choose_app_language.
  ///
  /// In en, this message translates to:
  /// **'Choose app language'**
  String get choose_app_language;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
