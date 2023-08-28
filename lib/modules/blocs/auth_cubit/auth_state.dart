part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailedState extends AuthState {
  String message;
  RegisterFailedState({required this.message});
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailedState extends AuthState {}
