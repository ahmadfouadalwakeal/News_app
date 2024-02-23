import 'package:bloc/bloc.dart';
import 'package:ixtask/domain/usecase/LoginUseCase.dart';
import 'package:meta/meta.dart';

import '../../data/authntiction/models/UserData.dart';
import '../../di/Locator.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>(_login);
  }
  void _login(LoginEvent event , Emitter<AuthState> emit){
    print("LoginEvent ${event.email} ${event.password} ${event.rememberme}");

    emit( LoadingLoginState());
     sl.get<LoginUseCase>().invoke(UserData(
        email: event.email,
        password: event.password,
        rememberMe: event.rememberme));

    emit (LogedState());
  }

}
