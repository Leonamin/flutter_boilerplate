// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get commonButtonGoHome => 'Go Home';

  @override
  String get commonButtonGoBack => 'Go Back';

  @override
  String get commonErrorPageNotFound => 'Page Not Found';

  @override
  String get commonErrorPageDescription =>
      'The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.';

  @override
  String get commonErrorPageHelp => 'Need help?';

  @override
  String get imageGalleryLoadFailed => 'Failed to load image';
}
