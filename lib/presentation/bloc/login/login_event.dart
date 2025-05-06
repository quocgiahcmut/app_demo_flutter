part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class Increment extends LoginEvent {
  const Increment();
}

class Decrement extends LoginEvent {
  const Decrement();
}