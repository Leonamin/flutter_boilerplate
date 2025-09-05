import 'package:flutter_boilerplate/core/base/base_repository.dart';

/// 인증 관련 데이터 접근 인터페이스
abstract class AuthRepository extends BaseRepository {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(String email, String password, String name);
  Future<void> logout();
  Future<Map<String, dynamic>?> getCurrentUser();
  Future<bool> isLoggedIn();
}

/// 인증 Repository 구현체
class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    return executeApiCall(
      () async {
        // TODO: 실제 API 호출 구현
        await Future.delayed(const Duration(seconds: 1)); // 시뮬레이션
        
        // 임시 응답 데이터
        return {
          'user': {
            'id': '1',
            'email': email,
            'name': 'Test User',
          },
          'token': 'sample_jwt_token',
        };
      },
      operationName: 'Login',
    );
  }

  @override
  Future<Map<String, dynamic>> register(String email, String password, String name) async {
    return executeApiCall(
      () async {
        // TODO: 실제 API 호출 구현
        await Future.delayed(const Duration(seconds: 1)); // 시뮬레이션
        
        return {
          'user': {
            'id': '2',
            'email': email,
            'name': name,
          },
          'token': 'sample_jwt_token',
        };
      },
      operationName: 'Register',
    );
  }

  @override
  Future<void> logout() async {
    return executeApiCall(
      () async {
        // TODO: 실제 로그아웃 처리 구현
        await Future.delayed(const Duration(milliseconds: 500));
      },
      operationName: 'Logout',
    );
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUser() async {
    return executeApiCall(
      () async {
        // TODO: 실제 사용자 정보 조회 구현
        await Future.delayed(const Duration(milliseconds: 500));
        
        return {
          'id': '1',
          'email': 'test@example.com',
          'name': 'Test User',
        };
      },
      operationName: 'Get Current User',
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return executeApiCall(
      () async {
        // TODO: 실제 로그인 상태 확인 구현
        await Future.delayed(const Duration(milliseconds: 200));
        return true; // 임시
      },
      operationName: 'Check Login Status',
    );
  }
}
