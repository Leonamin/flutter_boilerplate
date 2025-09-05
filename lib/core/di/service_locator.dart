import 'package:get/get.dart';

/// 서비스 로케이터 패턴을 위한 헬퍼 클래스
/// GetX의 Get.find()를 래핑하여 타입 안전성 제공
class ServiceLocator {
  /// Repository 가져오기
  static T repository<T>() => Get.find<T>();
  
  /// Service 가져오기
  static T service<T>() => Get.find<T>();
  
  /// Helper 가져오기
  static T helper<T>() => Get.find<T>();
  
  /// 일반적인 의존성 가져오기
  static T get<T>() => Get.find<T>();
  
  /// 의존성이 등록되어 있는지 확인
  static bool isRegistered<T>() => Get.isRegistered<T>();
}

/// 편의를 위한 전역 함수들
T repository<T>() => ServiceLocator.repository<T>();
T service<T>() => ServiceLocator.service<T>();
T helper<T>() => ServiceLocator.helper<T>();
