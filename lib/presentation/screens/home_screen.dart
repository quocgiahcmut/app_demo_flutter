import 'package:app_demo_flutter/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home screen'),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.loginRoute);
              },
              child: const Text('Go back Login'),
            )
          ],
        ),
      ),
    );
  }
}