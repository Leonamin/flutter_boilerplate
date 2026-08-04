// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Boilerplate';

  @override
  String get startupLoading => 'Preparing your app…';

  @override
  String get startupError => 'We couldn\'t restore your session.';

  @override
  String get commonRetryAction => 'Try again';

  @override
  String get authLoginTitle => 'Welcome back';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authSignInAction => 'Sign in';

  @override
  String get authSignOutAction => 'Sign out';

  @override
  String get authInvalidCredentials => 'Check your email and password.';

  @override
  String get commonUnexpectedError => 'Something went wrong. Please try again.';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeSignedInMessage => 'You are signed in.';

  @override
  String get commonButtonGoHome => 'Go Home';

  @override
  String get commonErrorPageNotFound => 'Page Not Found';

  @override
  String get commonErrorPageDescription =>
      'The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.';
}
