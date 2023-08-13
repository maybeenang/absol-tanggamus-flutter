import 'package:absensitanggamus/pages/home_page.dart';
import 'package:absensitanggamus/pages/login_page.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const App());
}

// Route configuration
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.bgColor,
            ));

        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.bgColor,
            ),
            home: SplashScreen(),
          );
        } else {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: _router,
              theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.bgColor,
              ));
        }
      },
    );
  }
}
