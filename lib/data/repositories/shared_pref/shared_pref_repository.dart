import 'package:flutter_boilerplate/core/base/base_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository extends BaseRepository {
  final SharedPreferences prefs;

  SharedPrefRepository(this.prefs);

  /// 키 값 목록

  /// 앱 첫 실행 여부: 온보딩을 위해 사용
  static const _keyIsFirstLaunch = 'is_first_launch';

  /// 테마 모드: 앱 테마 설정을 위해 사용 (system, light, dark)
  static const _keyThemeMode = 'theme_mode';

  /// 언어 설정: 앱 언어를 위해 사용 (ISO 639-1 코드)
  static const _keyLanguageCode = 'language_code';

  /// --- get/set ---

  bool get isFirstLaunch => prefs.getBool(_keyIsFirstLaunch) ?? true;

  Future<void> setIsFirstLaunch(bool value) async {
    await prefs.setBool(_keyIsFirstLaunch, value);
  }

  String get themeMode => prefs.getString(_keyThemeMode) ?? 'system';

  Future<void> setThemeMode(String value) async {
    await prefs.setString(_keyThemeMode, value);
  }

  String get languageCode => prefs.getString(_keyLanguageCode) ?? 'en';

  Future<void> setLanguageCode(String value) async {
    await prefs.setString(_keyLanguageCode, value);
  }
}
