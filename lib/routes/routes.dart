import 'package:absensitanggamus/pages/home_page.dart';
import 'package:absensitanggamus/pages/login_page.dart';
import 'package:absensitanggamus/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}
