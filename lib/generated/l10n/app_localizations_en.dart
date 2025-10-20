// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
