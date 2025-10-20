/// 서버 API 응답의 기본 구조를 정의하는 Base 클래스
/// 모든 API 응답은 이 구조를 따릅니다.
abstract class ApiResponse<T> {
  final bool success;
  final String? errorCode;
  final String? errorMessage;
  final Map<String, dynamic>? details;
  final T? data;

  const ApiResponse({
    required this.success,
    this.errorCode,
    this.errorMessage,
    this.details,
    this.data,
  });

  /// JSON에서 ApiResponse 생성하는 팩토리 메서드
  /// 구체적인 구현은 하위 클래스에서 제공해야 함
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    if (json['success'] == true) {
      return ApiSuccessResponse<T>(
        data: json['data'] != null ? fromJsonT(json['data']) : null,
      );
    } else {
      return ApiErrorResponse<T>(
        errorCode: json['error_code'] as String?,
        errorMessage: json['error_message'] as String?,
        details: json['details'] as Map<String, dynamic>?,
      );
    }
  }

  /// 성공 응답인지 확인
  bool get isSuccess => success;

  /// 에러 응답인지 확인
  bool get isError => !success;

  /// 데이터 안전하게 가져오기
  T? get safeData => isSuccess ? data : null;
}

/// 성공 응답 클래스
class ApiSuccessResponse<T> extends ApiResponse<T> {
  const ApiSuccessResponse({required super.data}) : super(success: true);

  /// JSON에서 성공 응답 생성
  factory ApiSuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiSuccessResponse<T>(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}

/// 에러 응답 클래스
class ApiErrorResponse<T> extends ApiResponse<T> {
  const ApiErrorResponse({super.errorCode, super.errorMessage, super.details})
    : super(success: false);

  /// JSON에서 에러 응답 생성
  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse<T>(
      errorCode: json['error_code'] as String?,
      errorMessage: json['error_message'] as String?,
      details: json['details'] as Map<String, dynamic>?,
    );
  }
}

/// 일반적인 데이터 응답 (제네릭)
class DataResponse<T> extends ApiResponse<T> {
  const DataResponse({
    required super.success,
    super.errorCode,
    super.errorMessage,
    super.details,
    super.data,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return DataResponse<T>(
      success: json['success'] ?? false,
      errorCode: json['error_code'] as String?,
      errorMessage: json['error_message'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  // 👇 데이터를 R 타입으로 변환하고 DataResponse<R>를 반환하는 메서드
  DataResponse<R> map<R>(R Function(T) converter) {
    return DataResponse<R>(
      success: success,
      errorCode: errorCode,
      errorMessage: errorMessage,
      details: details,
      // data가 null이 아니면 converter 함수를 사용하여 R 타입으로 변환
      data: data != null ? converter(data as T) : null,
    );
  }
}

/// 단순 성공/실패 응답 (데이터 없음)
class SimpleResponse extends ApiResponse<void> {
  const SimpleResponse({
    required super.success,
    super.errorCode,
    super.errorMessage,
    super.details,
  });

  factory SimpleResponse.fromJson(Map<String, dynamic> json) {
    return SimpleResponse(
      success: json['success'] ?? false,
      errorCode: json['error_code'] as String?,
      errorMessage: json['error_message'] as String?,
      details: json['details'] as Map<String, dynamic>?,
    );
  }
}
