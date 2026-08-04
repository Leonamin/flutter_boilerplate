import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/providers/auth_session_provider.dart';
import '../../features/auth/domain/entities/auth_session.dart';
import 'app_routes.dart';
import 'not_found_page.dart';
import 'router_refresh_listenable.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshListenable = RouterRefreshListenable();

  ref.listen(authSessionProvider, (previous, next) {
    if (previous != next) {
      refreshListenable.refresh();
    }
  });

  final router = GoRouter(
    initialLocation: const StartupRoute().location,
    routes: $appRoutes,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      return resolveRedirect(ref.read(authSessionProvider), state.uri);
    },
    errorBuilder: (context, state) => NotFoundPage(uri: state.uri),
  );

  ref.onDispose(() {
    router.dispose();
    refreshListenable.dispose();
  });
  return router;
});

String? resolveRedirect(AsyncValue<AuthSession> session, Uri location) {
  final isStartupLocation = location.path == StartupRoute.path;
  final isLoginLocation = location.path == LoginRoute.path;

  return session.when(
    loading: () => isStartupLocation
        ? null
        : StartupRoute(from: _safeReturnLocation(location.toString())).location,
    error: (error, stackTrace) => isStartupLocation
        ? null
        : StartupRoute(from: _destinationFrom(location)).location,
    data: (value) => value.when(
      unauthenticated: () {
        if (isLoginLocation) {
          return null;
        }
        return LoginRoute(from: _destinationFrom(location)).location;
      },
      authenticated: (user) {
        if (!isStartupLocation && !isLoginLocation) {
          return null;
        }
        return _destinationFrom(location);
      },
    ),
  );
}

String _destinationFrom(Uri location) {
  if (location.path == StartupRoute.path || location.path == LoginRoute.path) {
    return _safeReturnLocation(location.queryParameters['from']);
  }
  return _safeReturnLocation(location.toString());
}

String _safeReturnLocation(String? candidate) {
  if (candidate == null || candidate.isEmpty) {
    return HomeRoute.path;
  }

  final uri = Uri.tryParse(candidate);
  final isLocalLocation =
      uri != null &&
      !uri.hasScheme &&
      !uri.hasAuthority &&
      candidate.startsWith('/') &&
      !candidate.startsWith('//') &&
      uri.path != StartupRoute.path &&
      uri.path != LoginRoute.path;
  return isLocalLocation ? candidate : HomeRoute.path;
}
