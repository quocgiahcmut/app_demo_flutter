import 'package:app_demo_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: state.status == LoginStatus.failure && state.errorMessage?.contains('email') == true
                      ? state.errorMessage
                      : null
                  ),
                  onChanged: (email) => context.read<LoginBloc>().add(LoginEmailChanged(email)),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: state.status == LoginStatus.failure && state.errorMessage?.contains('password') == true
                      ? state.errorMessage
                      : null
                  ),
                  onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),

                ),
                const SizedBox(height: 16),

                state.status == LoginStatus.submitting
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: state.status == LoginStatus.success
                        ? null
                        : () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    child: const Text('Login'),
                  ),
                const SizedBox(height: 16),

                if (state.status == LoginStatus.success)
                  const Text(
                    'Login successful!',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),

                if (state.status == LoginStatus.failure &&
                    state.errorMessage != null &&
                    !state.errorMessage!.contains('email') &&
                    !state.errorMessage!.contains('password'))
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}