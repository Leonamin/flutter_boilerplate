import 'package:flutter_boilerplate/app/router/app_router.dart';
import 'package:flutter_boilerplate/app/router/app_routes.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const authenticatedSession = AuthSession.authenticated(
    user: AuthUser(id: 'person-id', email: 'person@example.com'),
  );

  group('resolveRedirect', () {
    test('sends protected locations to startup while session loads', () {
      expect(
        resolveRedirect(const AsyncLoading(), Uri.parse('/orders?tab=open')),
        StartupRoute(from: '/orders?tab=open').location,
      );
      expect(
        resolveRedirect(const AsyncLoading(), Uri.parse(StartupRoute.path)),
        isNull,
      );
    });

    test('sends unauthenticated sessions to login with a safe return path', () {
      expect(
        resolveRedirect(
          const AsyncData(AuthSession.unauthenticated()),
          Uri.parse('/orders/42'),
        ),
        const LoginRoute(from: '/orders/42').location,
      );
      expect(
        resolveRedirect(
          const AsyncData(AuthSession.unauthenticated()),
          Uri.parse('/startup?from=%2Forders%2F42'),
        ),
        const LoginRoute(from: '/orders/42').location,
      );
    });

    test('restores safe paths for authenticated sessions', () {
      expect(
        resolveRedirect(
          const AsyncData(authenticatedSession),
          Uri.parse('/login?from=%2Forders%2F42'),
        ),
        '/orders/42',
      );
      expect(
        resolveRedirect(
          const AsyncData(authenticatedSession),
          Uri.parse('/login?from=%2F%2Fevil.example'),
        ),
        HomeRoute.path,
      );
      expect(
        resolveRedirect(
          const AsyncData(authenticatedSession),
          Uri.parse('/orders/42'),
        ),
        isNull,
      );
    });

    test('sends session errors to a retryable startup route', () {
      expect(
        resolveRedirect(
          AsyncValue<AuthSession>.error(
            StateError('session failed'),
            StackTrace.empty,
          ),
          Uri.parse('/'),
        ),
        const StartupRoute(from: '/').location,
      );
      expect(
        resolveRedirect(
          AsyncValue<AuthSession>.error(
            StateError('session failed'),
            StackTrace.empty,
          ),
          Uri.parse('/startup?from=%2Forders'),
        ),
        isNull,
      );
    });
  });
}
