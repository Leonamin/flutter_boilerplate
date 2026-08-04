// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Flutter 보일러플레이트';

  @override
  String get startupLoading => '앱을 준비하고 있어요…';

  @override
  String get startupError => '세션을 불러오지 못했습니다.';

  @override
  String get commonRetryAction => '다시 시도';

  @override
  String get authLoginTitle => '다시 오신 것을 환영해요';

  @override
  String get authEmailLabel => '이메일';

  @override
  String get authPasswordLabel => '비밀번호';

  @override
  String get authSignInAction => '로그인';

  @override
  String get authSignOutAction => '로그아웃';

  @override
  String get authInvalidCredentials => '이메일과 비밀번호를 확인해 주세요.';

  @override
  String get commonUnexpectedError => '문제가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get homeTitle => '홈';

  @override
  String get homeSignedInMessage => '로그인되었습니다.';

  @override
  String get commonButtonGoHome => '홈으로 이동';

  @override
  String get commonErrorPageNotFound => '페이지를 찾을 수 없습니다';

  @override
  String get commonErrorPageDescription => '요청한 페이지가 삭제되었거나 주소가 변경되었습니다.';
}
