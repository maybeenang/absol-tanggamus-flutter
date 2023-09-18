import 'package:absensitanggamus/providers/auth_controller.dart';
import 'package:absensitanggamus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listener.g.dart';

@riverpod
class RouterListener extends _$RouterListener implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuth = false;

  @override
  FutureOr<void> build() async {
    _isAuth = await ref.watch(
      authControllerProvider.selectAsync(
        (value) => value.map(
          signIn: (_) => true,
          signOut: (_) => false,
          error: (_) => false,
        ),
      ),
    );

    ref.listenSelf(
      (_, __) {
        // One could write more conditional logic for when to call redirection
        if (state.isLoading) return;
        _routerListener?.call();
      },
    );
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.uri.toString() == SplashRoute.path;
    if (isSplash) {
      return _isAuth ? HomeRoute.path : LoginRoute.path;
    }

    final isLogin = state.uri.toString() == LoginRoute.path;
    if (isLogin) {
      return _isAuth ? HomeRoute.path : null;
    }

    return _isAuth ? null : SplashRoute.path;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
