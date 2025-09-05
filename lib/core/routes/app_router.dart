import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/core/routes/app_route_type.dart';
import 'package:flutter_boilerplate/core/routes/app_router_manager.dart';
import 'package:flutter_boilerplate/core/di/service_locator.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';
import 'package:flutter_boilerplate/domain/services/auth/auth_service.dart';
import 'package:flutter_boilerplate/features/auth/view_models/auth_view_model.dart';

// Views
import 'package:flutter_boilerplate/features/auth/views/auth_view.dart';
import 'package:flutter_boilerplate/shared/components/atoms/dialogs/dialog_usage_examples.dart';
import 'package:flutter_boilerplate/shared/components/atoms/bottom_sheets/bottom_sheet_usage_examples.dart';
import 'package:flutter_boilerplate/shared/components/atoms/toast/toast_usage_examples.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/usage_examples.dart';
import 'package:flutter_boilerplate/shared/components/atoms/dropdowns/dropdown_usage_examples.dart';

/// 앱의 라우터를 초기화하고 설정합니다
///
/// Returns: GoRouter - 설정된 라우터 인스턴스
GoRouter initAppRouter() {
  // 네비게이션 키들을 생성
  final rootNavKey = GlobalKey<NavigatorState>();

  // 라우터를 생성
  final router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation:
        AppRouteType.bottomSheetExamples.path, // 임시로 다이얼로그 예시를 초기 페이지로 설정
    // 에러 페이지 처리
    errorBuilder: (context, state) => _buildErrorPage(context, state),
    // 리다이렉트 처리
    redirect: _handleRedirect,
    routes: [
      // ==================== 인증 관련 라우트 ====================
      _buildAuthRoute(),

      // ==================== 메인 탭 라우트 ====================
      // TODO: 메인 탭 라우트들 구현

      // ==================== 예약 관련 라우트 ====================
      // TODO: 예약 관련 라우트들 구현

      // ==================== 설정 관련 라우트 ====================
      // TODO: 설정 관련 라우트들 구현

      // ==================== 예시 및 개발용 라우트 ====================
      ..._buildExampleRoutes(),
    ],
  );

  // RouterManager 초기화
  AppRouterManager.initialize(router);

  Logger.info('App router initialized', tag: 'AppRouter');
  return router;
}

/// 인증 관련 라우트를 생성합니다
GoRoute _buildAuthRoute() {
  return GoRoute(
    path: AppRouteType.auth.path,
    name: AppRouteType.auth.name,
    builder: (context, state) {
      return GetBuilder<AuthViewModel>(
        init: AuthViewModel(context, service<AuthService>()),
        builder: (controller) {
          return const AuthView();
        },
      );
    },
  );
}

/// 예시 페이지 라우트들을 생성합니다
List<GoRoute> _buildExampleRoutes() {
  return [
    // 토스트 예시
    GoRoute(
      path: AppRouteType.toastExamples.path,
      name: AppRouteType.toastExamples.name,
      builder: (context, state) => const ToastUsageExamples(),
    ),

    // 버튼 예시
    GoRoute(
      path: AppRouteType.buttonExamples.path,
      name: AppRouteType.buttonExamples.name,
      builder: (context, state) => const ButtonUsageExamples(),
    ),

    // 드롭다운 예시
    GoRoute(
      path: AppRouteType.dropdownExamples.path,
      name: AppRouteType.dropdownExamples.name,
      builder: (context, state) => const DropdownUsageExamples(),
    ),

    // 다이얼로그 예시
    GoRoute(
      path: AppRouteType.dialogExamples.path,
      name: AppRouteType.dialogExamples.name,
      builder: (context, state) => const DialogUsageExamples(),
    ),

    // 바텀시트 예시
    GoRoute(
      path: AppRouteType.bottomSheetExamples.path,
      name: AppRouteType.bottomSheetExamples.name,
      builder: (context, state) => const BottomSheetUsageExamples(),
    ),

    // 예시 메인 페이지
    GoRoute(
      path: AppRouteType.examples.path,
      name: AppRouteType.examples.name,
      builder: (context, state) => _buildExamplesMainPage(context),
    ),
  ];
}

/// 예시 메인 페이지를 생성합니다
Widget _buildExamplesMainPage(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('컴포넌트 예시'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildExampleTile(
          context,
          title: '토스트 예시',
          subtitle: '다양한 토스트 메시지 예시',
          onTap: () => context.goNamed(AppRouteType.toastExamples.name),
        ),
        _buildExampleTile(
          context,
          title: '버튼 예시',
          subtitle: '다양한 버튼 컴포넌트 예시',
          onTap: () => context.goNamed(AppRouteType.buttonExamples.name),
        ),
        _buildExampleTile(
          context,
          title: '드롭다운 예시',
          subtitle: '드롭다운 컴포넌트 예시',
          onTap: () => context.goNamed(AppRouteType.dropdownExamples.name),
        ),
        _buildExampleTile(
          context,
          title: '다이얼로그 예시',
          subtitle: '다양한 다이얼로그 컴포넌트 예시',
          onTap: () => context.goNamed(AppRouteType.dialogExamples.name),
        ),
        _buildExampleTile(
          context,
          title: '바텀시트 예시',
          subtitle: '다양한 바텀시트 컴포넌트 예시',
          onTap: () => context.goNamed(AppRouteType.bottomSheetExamples.name),
        ),
        _buildExampleTile(
          context,
          title: '인증 화면',
          subtitle: '로그인/회원가입 화면 예시',
          onTap: () => context.goNamed(AppRouteType.auth.name),
        ),
      ],
    ),
  );
}

/// 예시 타일을 생성합니다
Widget _buildExampleTile(
  BuildContext context, {
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    ),
  );
}

/// 리다이렉트 처리를 위한 함수
/// 인증이 필요한 라우트에 대한 접근을 제어합니다
String? _handleRedirect(BuildContext context, GoRouterState state) {
  try {
    // 인증 상태 확인
    final isAuthenticated = _checkAuthenticationStatus();

    // 현재 라우트가 인증이 필요한지 확인
    final currentRoute = AppRouteType.values.firstWhere(
      (route) => route.path == state.matchedLocation,
      orElse: () => AppRouteType.toastExamples, // 기본값
    );

    Logger.debug(
      'Redirect check - Route: ${currentRoute.name}, Auth: $isAuthenticated',
      tag: 'AppRouter',
    );

    // 인증이 필요한 라우트에 접근하려고 하는데 인증되지 않은 경우
    if (currentRoute.requiresAuth && !isAuthenticated) {
      Logger.info(
        'Redirecting to auth - unauthorized access to ${currentRoute.name}',
        tag: 'AppRouter',
      );
      return AppRouteType.auth.path;
    }

    // 이미 인증된 사용자가 인증 페이지에 접근하려는 경우
    if (currentRoute == AppRouteType.auth && isAuthenticated) {
      Logger.info(
        'Redirecting to home - already authenticated',
        tag: 'AppRouter',
      );
      return AppRouteType.home.path;
    }

    // 리다이렉트가 필요하지 않은 경우
    return null;
  } catch (e) {
    Logger.error('Redirect error: $e', tag: 'AppRouter');
    return null;
  }
}

/// 인증 상태를 확인합니다
bool _checkAuthenticationStatus() {
  try {
    // DI가 초기화되어 있고 AuthService가 등록되어 있는지 확인
    if (!ServiceLocator.isRegistered<AuthService>()) {
      Logger.warning('AuthService not registered', tag: 'AppRouter');
      return false;
    }

    // 실제 인증 서비스를 통한 상태 확인
    // final authService = service<AuthService>();
    // return authService.isAuthenticated;

    // 임시로 false 반환 (개발 중)
    return false;
  } catch (e) {
    Logger.warning('Failed to check auth status: $e', tag: 'AppRouter');
    return false;
  }
}

/// 에러 페이지를 생성합니다
Widget _buildErrorPage(BuildContext context, GoRouterState state) {
  Logger.error(
    'Route error - Path: ${state.uri.path}',
    tag: 'AppRouter',
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text('오류'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              '페이지를 찾을 수 없습니다',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '요청한 경로: ${state.uri.path}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRouteType.toastExamples.path),
              child: const Text('예시 페이지로 돌아가기'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => context.go(AppRouteType.examples.path),
              child: const Text('예시 메인으로 이동'),
            ),
          ],
        ),
      ),
    ),
  );
}
