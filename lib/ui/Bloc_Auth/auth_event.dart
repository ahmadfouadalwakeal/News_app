part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
 final String password;
 bool rememberme=false;

  LoginEvent(this.email,this.password,this.rememberme);

}
