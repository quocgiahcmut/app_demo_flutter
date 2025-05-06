import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<Increment>();
    on<Decrement>();
  }

  void _onIncrement(Increment event, Emitter<LoginState> emit) {
    emit(state)
  }
}