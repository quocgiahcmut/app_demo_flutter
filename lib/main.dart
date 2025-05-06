import 'package:app_demo_flutter/core/routes/app_routes.dart';
import 'package:app_demo_flutter/presentation/bloc/login/login_cubit.dart';
import 'package:app_demo_flutter/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => LoginCubit(),
        child: LoginScreen(),
      ),
    );
    // return MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   routerConfig: AppRoutes.router,
    // );
  }
}