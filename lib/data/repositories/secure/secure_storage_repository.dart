import 'package:flutter_boilerplate/core/base/base_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 초기화할 때, 생성자에 FlutterSecureStorage를 주입받는다.
/// Get.lazyPut(() => SecureStorageRepository(FlutterSecureStorage()));
class SecureStorageRepository extends BaseRepository {
  final FlutterSecureStorage storage;

  SecureStorageRepository(this.storage);

  /// --- 키 값 목록 ---
  static const _keyAccessToken = 'access_token';

  /// --- get/set ---

  Future<String> get accessToken async =>
      await storage.read(key: _keyAccessToken) ?? '';

  Future<void> setAccessToken(String token) async {
    await storage.write(key: _keyAccessToken, value: token);
  }

  Future<void> removeAccessToken() async {
    await storage.delete(key: _keyAccessToken);
  }
}
