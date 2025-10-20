import 'package:flutter/material.dart';
import '../../generated/l10n/app_localizations.dart';

/// 국제화 헬퍼 클래스
/// BuildContext를 통해 편리하게 번역된 텍스트에 접근할 수 있도록 제공
class AppLocalizationsHelper {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context);
  }
}

/// BuildContext 확장으로 국제화 텍스트에 쉽게 접근
/// 사용법: context.l10n.appTitle
extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
