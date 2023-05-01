part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class click_Event extends LoginEvent {
  String email;

  String password;

  click_Event({required this.email, required this.password});
}
class refresheventlogIn extends LoginEvent{
}