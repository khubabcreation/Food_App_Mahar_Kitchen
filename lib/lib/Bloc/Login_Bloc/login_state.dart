part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  String email;
  LoginLoadedState({required this.email});
}

class LoginErrorState extends LoginState {
  String message;

  LoginErrorState({required this.message});
}
