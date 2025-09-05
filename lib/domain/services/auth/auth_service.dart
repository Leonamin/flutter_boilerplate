import 'package:flutter_boilerplate/core/base/base_service.dart';
import 'package:flutter_boilerplate/data/repositories/auth/auth_repository.dart';

/// 인증 관련 비즈니스 로직 서비스
class AuthService extends BaseService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  /// 로그인
  Future<AuthResult> login(String email, String password) async {
    try {
      logInfo('Login attempt for email: $email');
      
      // 입력 유효성 검사
      if (email.isEmpty || password.isEmpty) {
        return AuthResult.failure('이메일과 비밀번호를 입력해주세요.');
      }

      if (!_isValidEmail(email)) {
        return AuthResult.failure('올바른 이메일 형식이 아닙니다.');
      }

      // Repository를 통한 로그인 처리
      final response = await _authRepository.login(email, password);
      
      logInfo('Login successful for email: $email');
      return AuthResult.success(response);
      
    } catch (error, stackTrace) {
      logError('Login failed for email: $email', error: error, stackTrace: stackTrace);
      return AuthResult.failure('로그인에 실패했습니다. 다시 시도해주세요.');
    }
  }

  /// 회원가입
  Future<AuthResult> register(String email, String password, String name) async {
    try {
      logInfo('Register attempt for email: $email');
      
      // 입력 유효성 검사
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        return AuthResult.failure('모든 필드를 입력해주세요.');
      }

      if (!_isValidEmail(email)) {
        return AuthResult.failure('올바른 이메일 형식이 아닙니다.');
      }

      if (password.length < 6) {
        return AuthResult.failure('비밀번호는 6자 이상이어야 합니다.');
      }

      // Repository를 통한 회원가입 처리
      final response = await _authRepository.register(email, password, name);
      
      logInfo('Register successful for email: $email');
      return AuthResult.success(response);
      
    } catch (error, stackTrace) {
      logError('Register failed for email: $email', error: error, stackTrace: stackTrace);
      return AuthResult.failure('회원가입에 실패했습니다. 다시 시도해주세요.');
    }
  }

  /// 로그아웃
  Future<bool> logout() async {
    try {
      logInfo('Logout attempt');
      
      await _authRepository.logout();
      
      logInfo('Logout successful');
      return true;
      
    } catch (error, stackTrace) {
      logError('Logout failed', error: error, stackTrace: stackTrace);
      return false;
    }
  }

  /// 현재 사용자 정보 조회
  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      return await _authRepository.getCurrentUser();
    } catch (error, stackTrace) {
      logError('Get current user failed', error: error, stackTrace: stackTrace);
      return null;
    }
  }

  /// 로그인 상태 확인
  Future<bool> isLoggedIn() async {
    try {
      return await _authRepository.isLoggedIn();
    } catch (error, stackTrace) {
      logError('Check login status failed', error: error, stackTrace: stackTrace);
      return false;
    }
  }

  /// 이메일 유효성 검사
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

/// 인증 결과 클래스
class AuthResult {
  final bool isSuccess;
  final String? message;
  final Map<String, dynamic>? data;

  AuthResult._({
    required this.isSuccess,
    this.message,
    this.data,
  });

  factory AuthResult.success(Map<String, dynamic> data) {
    return AuthResult._(
      isSuccess: true,
      data: data,
    );
  }

  factory AuthResult.failure(String message) {
    return AuthResult._(
      isSuccess: false,
      message: message,
    );
  }
}
