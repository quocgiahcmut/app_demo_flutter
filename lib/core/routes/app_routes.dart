import 'package:app_demo_flutter/presentation/screens/home_screen.dart';
import 'package:app_demo_flutter/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';

  static final GoRouter router = GoRouter(
    initialLocation: homeRoute,
    routes: [
      GoRoute(path: loginRoute, builder: (context, state) => const LoginScreen()),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeScreen())
    ]
  );
}