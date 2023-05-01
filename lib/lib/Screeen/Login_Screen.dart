import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooood/lib/Bloc/Login_Bloc/login_bloc.dart';
import 'package:fooood/lib/Screeen/Post_Screen.dart';

import '../data/initial_screen.dart';
import 'package:provider/provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF6B5E55),
            Color(0xFF5D5047),
            Color(0xFF423731),
            Color(0xFF382D27),
            Color(0xFF302720),
          ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginInitial) {
                return Initial(
                  validaionKey: key,
                );
              } else if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginLoadedState) {
                String email = state.email;
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PostScreen(
                        email: email,
                      );
                    },
                  ));
                  FocusManager.instance.primaryFocus!.unfocus();
                });
              } else if (state is LoginErrorState) {
                return Text('wait');
              } else {
                return SizedBox();
              }
              return SizedBox();
            }),
          ),
        ),
      )),
    );
  }
}
