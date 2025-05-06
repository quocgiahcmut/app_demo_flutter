import 'package:app_demo_flutter/presentation/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();

    return Scaffold(
      body: BlocBuilder<LoginCubit, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => cubit.increment(),
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 4,),
          FloatingActionButton(
            onPressed: () => cubit.decrement(),
            child: Icon(Icons.remove),
          )
        ],
      )
    );
  }
}