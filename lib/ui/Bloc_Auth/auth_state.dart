part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoadingLoginState extends AuthState {}

class LogedState extends AuthState {}
