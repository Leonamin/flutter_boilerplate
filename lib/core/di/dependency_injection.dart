import 'package:flutter_boilerplate/domain/services/common/fgbg_service.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';
import 'package:flutter_boilerplate/data/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/domain/services/auth/auth_service.dart';

/// 의존성 주입 관리 클래스
class DependencyInjection {
  static bool _isInitialized = false;

  /// DI 초기화
  static Future<void> init() async {
    if (_isInitialized) {
      Logger.warning('DI already initialized');
      return;
    }

    Logger.info('Initializing dependencies...');

    // Repository 등록
    await _initRepositories();

    // Service 등록
    await _initServices();

    // Helper 등록
    await _initHelpers();

    _isInitialized = true;
    Logger.info('Dependencies initialization completed');
  }

  /// Repository 의존성 등록
  static Future<void> _initRepositories() async {
    Logger.info('Registering repositories...');

    // AuthRepository 등록
    Get.put<AuthRepository>(AuthRepositoryImpl(), permanent: true);

    // 추가 Repository들은 필요에 따라 등록
    // Get.put<BookingRepository>(BookingRepositoryImpl(), permanent: true);
    // Get.put<HomeRepository>(HomeRepositoryImpl(), permanent: true);

    Logger.info('Repositories registered');
  }

  /// Service 의존성 등록
  static Future<void> _initServices() async {
    Logger.info('Registering services...');

    // AuthService 등록
    Get.put<AuthService>(
      AuthService(Get.find<AuthRepository>()),
      permanent: true,
    );

    // FGBGService 등록
    Get.put<FGBGService>(FGBGService(), permanent: true);

    // 추가 Service들은 필요에 따라 등록
    // Get.put<BookingService>(BookingService(Get.find<BookingRepository>()), permanent: true);
    // Get.put<HomeService>(HomeService(Get.find<HomeRepository>()), permanent: true);

    Logger.info('Services registered');
  }

  /// Helper 의존성 등록
  static Future<void> _initHelpers() async {
    Logger.info('Registering helpers...');

    // 예시: NetworkHelper, StorageHelper 등 등록
    // Get.put<NetworkHelper>(NetworkHelper(), permanent: true);
    // Get.put<StorageHelper>(StorageHelper(), permanent: true);

    Logger.info('Helpers registered');
  }

  /// 특정 타입의 의존성 가져오기
  static T find<T>() {
    try {
      return Get.find<T>();
    } catch (e) {
      Logger.error('Failed to find dependency: $T', error: e);
      rethrow;
    }
  }

  /// 의존성이 등록되어 있는지 확인
  static bool isRegistered<T>() {
    return Get.isRegistered<T>();
  }

  /// DI 초기화 상태 확인
  static bool get isInitialized => _isInitialized;
}
