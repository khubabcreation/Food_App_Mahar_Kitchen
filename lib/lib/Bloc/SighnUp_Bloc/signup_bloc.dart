import 'package:bloc/bloc.dart';

import 'package:fooood/lib/Bloc/SighnUp_Bloc/signup_event.dart';

import 'package:meta/meta.dart';

import '../../Models/SignUp_Model_Class.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUPEvent>((event, emit) async {
      emit.call(SignupLoadingState());
      String email = event.email;
      String newpassword = event.newpassword;
      String name = event.name;

      try {
        Map<String, dynamic>? data =
            await SignUpMethod(email, newpassword, name);

        if (data != null) {
          emit.call(SignupLoadedState());
        } else {
          emit.call(SignupErrorState(message: "some thing wrong"));
        }
      } catch (e) {
        emit.call(SignupErrorState(message: e.toString()));
      }
    });
    on<SignupRefreshEvent>((event, emit) => emit.call(SignupInitial()));
  }
}
