/// 앱의 모든 라우트 타입을 정의하는 열거형
/// 각 라우트는 고유한 경로와 이름을 가집니다
enum AppRouteType {
  // ==================== 인증 관련 라우트 ====================
  /// 스플래시 화면
  splash,

  /// 로그인/회원가입 화면
  auth,

  // ==================== 메인 탭 라우트 ====================
  /// 홈 화면
  home,

  /// 예약 목록 화면
  booking,

  /// 예약 상세 화면
  bookingDetail,

  /// 프로필 화면
  profile,

  // ==================== 예약 관련 라우트 ====================
  /// 예약 생성 화면
  bookingCreate,

  /// 예약 수정 화면
  bookingEdit,

  /// 예약 확인 화면
  bookingConfirmation,

  // ==================== 설정 관련 라우트 ====================
  /// 설정 화면
  settings,

  /// 알림 설정 화면
  notificationSettings,

  /// 언어 설정 화면
  languageSettings,

  // ==================== 예시 및 개발용 라우트 ====================
  /// 컴포넌트 예시 화면
  examples,

  /// 토스트 예시 화면
  toastExamples,

  /// 버튼 예시 화면
  buttonExamples,

  /// 드롭다운 예시 화면
  dropdownExamples,

  /// 체크박스 예시 화면
  checkboxExamples,

  /// 라디오버튼 예시 화면
  radioButtonExamples,

  /// 토글버튼 예시 화면
  toggleButtonExamples,

  /// 텍스트필드 예시 화면
  textFieldExamples,

  /// 다이얼로그 예시 화면
  dialogExamples,

  /// 바텀시트 예시 화면
  bottomSheetExamples,
}

/// 라우트 경로 상수 정의
class AppRoutePaths {
  // 인증 관련 경로
  static const String splash = '/splash';
  static const String auth = '/auth';

  // 메인 탭 경로
  static const String home = '/home';
  static const String booking = '/booking';
  static const String bookingDetail = '/booking/:id';
  static const String profile = '/profile';

  // 예약 관련 경로
  static const String bookingCreate = '/booking/create';
  static const String bookingEdit = '/booking/:id/edit';
  static const String bookingConfirmation = '/booking/confirmation';

  // 설정 관련 경로
  static const String settings = '/settings';
  static const String notificationSettings = '/settings/notification';
  static const String languageSettings = '/settings/language';

  // 예시 및 개발용 경로
  static const String examples = '/examples';
  static const String toastExamples = '/examples/toast';
  static const String buttonExamples = '/examples/button';
  static const String dropdownExamples = '/examples/dropdown';
  static const String checkboxExamples = '/examples/checkbox';
  static const String radioButtonExamples = '/examples/radio-button';
  static const String toggleButtonExamples = '/examples/toggle-button';
  static const String textFieldExamples = '/examples/text-field';

  static const String dialogExamples = '/examples/dialog';
  static const String bottomSheetExamples = '/examples/bottom-sheet';
}

/// AppRouteType에 대한 확장 메서드
extension AppRouteTypeExtension on AppRouteType {
  /// 라우트의 경로를 반환합니다
  String get path {
    switch (this) {
      // 인증 관련
      case AppRouteType.splash:
        return AppRoutePaths.splash;
      case AppRouteType.auth:
        return AppRoutePaths.auth;

      // 메인 탭
      case AppRouteType.home:
        return AppRoutePaths.home;
      case AppRouteType.booking:
        return AppRoutePaths.booking;
      case AppRouteType.bookingDetail:
        return AppRoutePaths.bookingDetail;
      case AppRouteType.profile:
        return AppRoutePaths.profile;

      // 예약 관련
      case AppRouteType.bookingCreate:
        return AppRoutePaths.bookingCreate;
      case AppRouteType.bookingEdit:
        return AppRoutePaths.bookingEdit;
      case AppRouteType.bookingConfirmation:
        return AppRoutePaths.bookingConfirmation;

      // 설정 관련
      case AppRouteType.settings:
        return AppRoutePaths.settings;
      case AppRouteType.notificationSettings:
        return AppRoutePaths.notificationSettings;
      case AppRouteType.languageSettings:
        return AppRoutePaths.languageSettings;

      // 예시 및 개발용
      case AppRouteType.examples:
        return AppRoutePaths.examples;
      case AppRouteType.toastExamples:
        return AppRoutePaths.toastExamples;
      case AppRouteType.buttonExamples:
        return AppRoutePaths.buttonExamples;
      case AppRouteType.dropdownExamples:
        return AppRoutePaths.dropdownExamples;
      case AppRouteType.checkboxExamples:
        return AppRoutePaths.checkboxExamples;
      case AppRouteType.radioButtonExamples:
        return AppRoutePaths.radioButtonExamples;
      case AppRouteType.toggleButtonExamples:
        return AppRoutePaths.toggleButtonExamples;
      case AppRouteType.textFieldExamples:
        return AppRoutePaths.textFieldExamples;
      case AppRouteType.dialogExamples:
        return AppRoutePaths.dialogExamples;
      case AppRouteType.bottomSheetExamples:
        return AppRoutePaths.bottomSheetExamples;
    }
  }

  /// 라우트의 이름을 반환합니다
  String get name => toString().split('.').last;

  /// 라우트가 인증이 필요한지 확인합니다
  bool get requiresAuth {
    switch (this) {
      case AppRouteType.splash:
      case AppRouteType.auth:
        return false;
      case AppRouteType.examples:
      case AppRouteType.toastExamples:
      case AppRouteType.buttonExamples:
      case AppRouteType.dropdownExamples:
      case AppRouteType.checkboxExamples:
      case AppRouteType.radioButtonExamples:
      case AppRouteType.toggleButtonExamples:
      case AppRouteType.textFieldExamples:
      case AppRouteType.dialogExamples:
      case AppRouteType.bottomSheetExamples:
        return false;
      default:
        return true;
    }
  }

  /// 라우트가 메인 탭 라우트인지 확인합니다
  bool get isMainTabRoute {
    switch (this) {
      case AppRouteType.home:
      case AppRouteType.booking:
      case AppRouteType.profile:
        return true;
      default:
        return false;
    }
  }

  /// 라우트가 예약 관련 라우트인지 확인합니다
  bool get isBookingRoute {
    switch (this) {
      case AppRouteType.booking:
      case AppRouteType.bookingDetail:
      case AppRouteType.bookingCreate:
      case AppRouteType.bookingEdit:
      case AppRouteType.bookingConfirmation:
        return true;
      default:
        return false;
    }
  }

  /// 라우트가 예시 페이지인지 확인합니다
  bool get isExampleRoute {
    switch (this) {
      case AppRouteType.examples:
      case AppRouteType.toastExamples:
      case AppRouteType.buttonExamples:
      case AppRouteType.dropdownExamples:
      case AppRouteType.checkboxExamples:
      case AppRouteType.radioButtonExamples:
      case AppRouteType.toggleButtonExamples:
      case AppRouteType.textFieldExamples:
      case AppRouteType.dialogExamples:
      case AppRouteType.bottomSheetExamples:
        return true;
      default:
        return false;
    }
  }
}
