import 'package:absensitanggamus/helpers/state_logger.dart';
import 'package:absensitanggamus/routes/router_listener.dart';
import 'package:absensitanggamus/routes/routes.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  runApp(
    const ProviderScope(observers: [
      StateLogger(),
    ], child: App()),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshNotifier = ref.watch(routerListenerProvider.notifier);
    final routes = useMemoized(
      () => GoRouter(
        routes: $appRoutes,
        initialLocation: SplashRoute.path,
        refreshListenable: refreshNotifier,
        redirect: refreshNotifier.redirect,
      ),
      [refreshNotifier],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
    );
  }
}
