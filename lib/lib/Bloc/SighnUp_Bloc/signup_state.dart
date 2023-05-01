part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupLoadedState extends SignupState {}

class SignupErrorState extends SignupState {
  String message;

  SignupErrorState({required this.message});
}
