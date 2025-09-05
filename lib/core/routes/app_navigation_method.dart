import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 네비게이션 방법을 정의하는 열거형
/// 각 방법은 다른 네비게이션 동작을 수행합니다
enum AppNavigationMethod {
  /// 현재 스택을 모두 제거하고 새로운 라우트로 이동
  go,
  /// 현재 스택 위에 새로운 라우트를 추가
  push,
  /// 현재 라우트를 새로운 라우트로 교체
  replacement,
  /// 현재 스택을 모두 제거하고 새로운 라우트로 이동 (pushReplacementNamed 사용)
  pushReplacement,
  /// 이전 라우트로 돌아가기
  pop,
}

/// 네비게이션 결과를 나타내는 클래스
class AppNavigationResult<T> {
  final bool success;
  final T? data;
  final String? error;

  const AppNavigationResult({
    required this.success,
    this.data,
    this.error,
  });

  factory AppNavigationResult.success([T? data]) => AppNavigationResult(
        success: true,
        data: data,
      );

  factory AppNavigationResult.error(String error) => AppNavigationResult(
        success: false,
        error: error,
      );
}

/// AppNavigationMethod에 대한 확장 메서드
extension AppNavigationMethodExtension on AppNavigationMethod {
  /// 타입 안전한 네비게이션을 수행합니다
  /// 
  /// [context] - BuildContext
  /// [name] - 라우트 이름
  /// [pathParameters] - 경로 파라미터
  /// [queryParameters] - 쿼리 파라미터
  /// [extra] - 추가 데이터 (타입 안전성을 위해 제네릭 사용)
  /// 
  /// Returns: AppNavigationResult<T> - 네비게이션 결과
  Future<AppNavigationResult<T>> navigateTo<T>({
    required BuildContext context,
    required String name,
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    T? extra,
  }) async {
    try {
      switch (this) {
        case AppNavigationMethod.go:
          context.goNamed(
            name,
            pathParameters: pathParameters,
            queryParameters: queryParameters,
            extra: extra,
          );
          return AppNavigationResult.success();

        case AppNavigationMethod.push:
          final result = await context.pushNamed<T>(
            name,
            pathParameters: pathParameters,
            queryParameters: queryParameters,
            extra: extra,
          );
          return AppNavigationResult.success(result);

        case AppNavigationMethod.pushReplacement:
          context.pushReplacementNamed(
            name,
            pathParameters: pathParameters,
            queryParameters: queryParameters,
            extra: extra,
          );
          return AppNavigationResult.success();

        case AppNavigationMethod.replacement:
          context.replaceNamed(
            name,
            pathParameters: pathParameters,
            queryParameters: queryParameters,
            extra: extra,
          );
          return AppNavigationResult.success();

        case AppNavigationMethod.pop:
          final result = context.pop<T>() as T?;
          return AppNavigationResult.success(result);
      }
    } catch (e) {
      return AppNavigationResult.error('Navigation failed: ${e.toString()}');
    }
  }

  /// 간단한 네비게이션을 위한 헬퍼 메서드
  /// 에러 처리가 필요 없는 경우 사용
  void navigateToSimple({
    required BuildContext context,
    required String name,
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    switch (this) {
      case AppNavigationMethod.go:
        context.goNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra,
        );
        break;
      case AppNavigationMethod.push:
        context.pushNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra,
        );
        break;
      case AppNavigationMethod.pushReplacement:
        context.pushReplacementNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra,
        );
        break;
      case AppNavigationMethod.replacement:
        context.replaceNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra,
        );
        break;
      case AppNavigationMethod.pop:
        context.pop();
        break;
    }
  }
}
