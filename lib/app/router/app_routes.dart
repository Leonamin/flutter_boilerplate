import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/router/startup_page.dart';
import 'package:flutter_boilerplate/features/auth/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/features/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

@TypedGoRoute<StartupRoute>(path: StartupRoute.path)
class StartupRoute extends GoRouteData with $StartupRoute {
  const StartupRoute({this.from});

  static const path = '/startup';

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StartupPage();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute({this.from});

  static const path = '/login';

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
