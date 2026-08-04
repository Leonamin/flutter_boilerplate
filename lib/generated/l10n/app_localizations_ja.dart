// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Flutter ボイラープレート';

  @override
  String get startupLoading => 'アプリを準備しています…';

  @override
  String get startupError => 'セッションを復元できませんでした。';

  @override
  String get commonRetryAction => 'もう一度試す';

  @override
  String get authLoginTitle => 'おかえりなさい';

  @override
  String get authEmailLabel => 'メールアドレス';

  @override
  String get authPasswordLabel => 'パスワード';

  @override
  String get authSignInAction => 'ログイン';

  @override
  String get authSignOutAction => 'ログアウト';

  @override
  String get authInvalidCredentials => 'メールアドレスとパスワードを確認してください。';

  @override
  String get commonUnexpectedError => '問題が発生しました。もう一度お試しください。';

  @override
  String get homeTitle => 'ホーム';

  @override
  String get homeSignedInMessage => 'ログインしています。';

  @override
  String get commonButtonGoHome => 'ホームへ';

  @override
  String get commonErrorPageNotFound => 'ページが見つかりません';

  @override
  String get commonErrorPageDescription => 'お探しのページは削除されたか、アドレスが変更されています。';
}
