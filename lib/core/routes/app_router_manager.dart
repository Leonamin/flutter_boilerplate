import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';

/// 라우터 관리를 위한 싱글톤 클래스
/// 애플리케이션 전체에서 라우터 인스턴스를 관리합니다
class AppRouterManager {
  static AppRouterManager? _instance;
  static GoRouter? _goRouter;

  /// 싱글톤 인스턴스를 반환합니다
  static AppRouterManager get instance {
    _instance ??= AppRouterManager._();
    return _instance!;
  }

  AppRouterManager._();

  /// GoRouter 인스턴스를 설정합니다
  /// 애플리케이션 초기화 시 한 번만 호출되어야 합니다
  static void initialize(GoRouter router) {
    _goRouter = router;
    Logger.info('Router initialized', tag: 'AppRouterManager');
  }

  /// GoRouter 인스턴스를 반환합니다
  /// 초기화되지 않은 경우 예외를 발생시킵니다
  GoRouter get goRouter {
    if (_goRouter == null) {
      throw StateError('AppRouterManager가 초기화되지 않았습니다. initialize()를 먼저 호출하세요.');
    }
    return _goRouter!;
  }

  /// 현재 BuildContext를 반환합니다
  /// 라우터가 초기화되지 않은 경우 null을 반환합니다
  BuildContext? get context => goRouter.routerDelegate.navigatorKey.currentContext;

  /// 라우터 델리게이트를 반환합니다
  GoRouterDelegate get routerDelegate => goRouter.routerDelegate;

  /// 현재 경로를 반환합니다
  /// 라우터가 초기화되지 않은 경우 빈 문자열을 반환합니다
  String get currentPath {
    try {
      return routerDelegate.currentConfiguration.last.route.path;
    } catch (e) {
      Logger.warning('Failed to get current path: $e', tag: 'AppRouterManager');
      return '';
    }
  }

  /// 전체 경로를 반환합니다
  /// 라우터가 초기화되지 않은 경우 빈 문자열을 반환합니다
  String get fullPath {
    try {
      return routerDelegate.currentConfiguration.fullPath;
    } catch (e) {
      Logger.warning('Failed to get full path: $e', tag: 'AppRouterManager');
      return '';
    }
  }

  /// 현재 위치를 반환합니다
  String get currentLocation {
    try {
      return goRouter.routeInformationProvider.value.uri.toString();
    } catch (e) {
      Logger.warning('Failed to get current location: $e', tag: 'AppRouterManager');
      return '';
    }
  }

  /// 라우터 리스너를 추가합니다
  void addListener(VoidCallback listener) {
    routerDelegate.addListener(listener);
  }

  /// 라우터 리스너를 제거합니다
  void removeListener(VoidCallback listener) {
    routerDelegate.removeListener(listener);
  }

  /// 현재 라우트가 특정 경로인지 확인합니다
  bool isCurrentPath(String path) {
    return currentPath == path;
  }

  /// 현재 라우트가 특정 경로로 시작하는지 확인합니다
  bool isCurrentPathStartsWith(String path) {
    return currentPath.startsWith(path);
  }

  /// 현재 위치가 특정 경로인지 확인합니다
  bool isCurrentLocation(String location) {
    return currentLocation == location;
  }

  /// 현재 위치가 특정 경로로 시작하는지 확인합니다
  bool isCurrentLocationStartsWith(String location) {
    return currentLocation.startsWith(location);
  }

  /// 라우터가 초기화되었는지 확인합니다
  bool get isInitialized => _goRouter != null;

  /// 현재 라우트 정보를 로깅합니다
  void logCurrentRoute() {
    Logger.info('Current path: $currentPath', tag: 'AppRouterManager');
    Logger.info('Current location: $currentLocation', tag: 'AppRouterManager');
    Logger.info('Full path: $fullPath', tag: 'AppRouterManager');
  }

  /// 라우터를 리셋합니다 (테스트용)
  @visibleForTesting
  static void reset() {
    _instance = null;
    _goRouter = null;
    Logger.info('Router reset', tag: 'AppRouterManager');
  }
}
