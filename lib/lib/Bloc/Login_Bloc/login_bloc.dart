import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Models/Login_Model_Class.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<click_Event>((event, emit) async {
      emit.call(LoginLoadingState());
      String email = event.email;
      String password = event.password;

      try {
        Map<String, dynamic>? data =
            await LoginMethod(email.toString(), password.toString());
        if (data != null) {
          emit.call(LoginLoadedState(email: email.toString()));
        } else {
          emit.call(LoginErrorState(message: 'There is no data'));
        }
      } catch (e) {
        emit.call(LoginErrorState(message: e.toString()));
      }
    });

    on<refresheventlogIn>((event, emit) {
      emit.call(LoginInitial());
    });
  }
}
