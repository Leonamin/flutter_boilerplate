import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/routes/app_route_type.dart';
import 'package:flutter_boilerplate/core/routes/app_navigation_method.dart';

/// 앱 전체에서 사용하는 공통 네비게이션 메서드들을 제공하는 클래스
/// 타입 안전성과 일관된 네비게이션 경험을 보장합니다
class AppNavigator {
  const AppNavigator._();

  // ==================== 메인 네비게이션 ====================

  /// 홈 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToHome(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.pushReplacement,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.home.name,
    );
  }

  /// 스플래시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToSplash(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.pushReplacement,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.splash.name,
    );
  }

  /// 인증 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToAuth(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.pushReplacement,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.auth.name,
    );
  }

  // ==================== 예약 관련 네비게이션 ====================

  /// 예약 목록 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToBooking(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.booking.name,
    );
  }

  /// 예약 상세 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToBookingDetail(
    BuildContext context, {
    required String bookingId,
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.bookingDetail.name,
      pathParameters: {'id': bookingId},
    );
  }

  /// 예약 생성 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToBookingCreate(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.bookingCreate.name,
    );
  }

  /// 예약 수정 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToBookingEdit(
    BuildContext context, {
    required String bookingId,
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.bookingEdit.name,
      pathParameters: {'id': bookingId},
    );
  }

  /// 예약 확인 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToBookingConfirmation(
    BuildContext context, {
    Map<String, dynamic>? bookingData,
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.bookingConfirmation.name,
      extra: bookingData,
    );
  }

  // ==================== 프로필 관련 네비게이션 ====================

  /// 프로필 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToProfile(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.profile.name,
    );
  }

  // ==================== 설정 관련 네비게이션 ====================

  /// 설정 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToSettings(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.settings.name,
    );
  }

  /// 알림 설정 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToNotificationSettings(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.notificationSettings.name,
    );
  }

  /// 언어 설정 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToLanguageSettings(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.languageSettings.name,
    );
  }

  // ==================== 예시 페이지 네비게이션 ====================

  /// 예시 메인 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.examples.name,
    );
  }

  /// 토스트 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToToastExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.toastExamples.name,
    );
  }

  /// 버튼 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToButtonExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.buttonExamples.name,
    );
  }

  /// 드롭다운 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToDropdownExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.dropdownExamples.name,
    );
  }

  /// 체크박스 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToCheckboxExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.checkboxExamples.name,
    );
  }

  /// 라디오버튼 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToRadioButtonExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.radioButtonExamples.name,
    );
  }

  /// 토글버튼 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToToggleButtonExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.toggleButtonExamples.name,
    );
  }

  /// 텍스트필드 예시 화면으로 네비게이션합니다
  static Future<AppNavigationResult<void>> navigateToTextFieldExamples(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) async {
    return method.navigateTo(
      context: context,
      name: AppRouteType.textFieldExamples.name,
    );
  }

  // ==================== 헬퍼 메서드 ====================

  /// 간단한 네비게이션을 위한 헬퍼 메서드들
  /// 에러 처리가 필요 없는 경우 사용

  static void navigateToHomeSimple(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.pushReplacement,
  }) {
    method.navigateToSimple(
      context: context,
      name: AppRouteType.home.name,
    );
  }

  static void navigateToAuthSimple(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.pushReplacement,
  }) {
    method.navigateToSimple(
      context: context,
      name: AppRouteType.auth.name,
    );
  }

  static void navigateToBookingSimple(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) {
    method.navigateToSimple(
      context: context,
      name: AppRouteType.booking.name,
    );
  }

  static void navigateToProfileSimple(
    BuildContext context, {
    AppNavigationMethod method = AppNavigationMethod.push,
  }) {
    method.navigateToSimple(
      context: context,
      name: AppRouteType.profile.name,
    );
  }

  /// 뒤로 가기
  static void pop(BuildContext context, [dynamic result]) {
    AppNavigationMethod.pop.navigateToSimple(
      context: context,
      name: '', // pop에서는 사용되지 않음
      extra: result,
    );
  }
}
