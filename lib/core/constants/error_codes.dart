/// 서버 Edge Function에서 반환하는 에러 코드 상수들
/// 다국어화 처리를 위해 사용됩니다.
class ErrorCodes {
  // 인증 관련 에러
  static const String authUnauthorized = 'AUTH_UNAUTHORIZED';
  static const String authInvalidToken = 'AUTH_INVALID_TOKEN';
  static const String authTokenExpired = 'AUTH_TOKEN_EXPIRED';

  // 공통 에러
  static const String apiError = 'API_ERROR';

  // 모름
  static const String unknownError = 'UNKNOWN_ERROR';
}
