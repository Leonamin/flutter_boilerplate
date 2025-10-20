import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_boilerplate/build_config.dart';

/// Supabase 설정 클래스
class SupabaseConfig {
  /// Supabase 초기화
  static Future<void> initialize() async {
    if (!BuildConfig.usingSupabase) return;
    await Supabase.initialize(
      url: BuildConfig.supabaseUrl,
      anonKey: BuildConfig.supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  /// Supabase 클라이언트 인스턴스 가져오기
  static SupabaseClient get client => Supabase.instance.client;

  /// 인증된 사용자 정보 가져오기
  static User? get currentUser => client.auth.currentUser;

  /// 사용자 ID 가져오기
  static String? get currentUserId => currentUser?.id;

  /// 로그인 상태 확인
  static bool get isLoggedIn => currentUser != null;
}
