part of 'login_bloc.dart';

enum LoginStatus { initial, submitting, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String email;
  final String password;
  final String? errorMessage;

  const LoginState({
    required this.status,
    required this.email,
    required this.password,
    this.errorMessage,
  });

  factory LoginState.initial() => const LoginState(
    status: LoginStatus.initial,
    email: '',
    password: ''
  );

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status, email, password, errorMessage];
}