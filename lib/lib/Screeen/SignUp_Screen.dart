import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooood/lib/Bloc/SighnUp_Bloc/signup_bloc.dart';
import 'package:fooood/lib/Bloc/SighnUp_Bloc/signup_event.dart';
import 'package:fooood/lib/Widget/First_Second_Name.dart';
import 'package:fooood/lib/Widget/Password.dart';
import 'package:fooood/lib/Widget/Title_Of_App.dart';

import 'package:provider/provider.dart';
import '../Widget/Custome_button.dart';
import '../Widget/Email.dart';
import 'Login_Screen.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    var SignUpEventProvider = Provider.of<SignupBloc>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF6B5E55),
                  Color(0xFF5D5047),
                  Color(0xFF423731),
                  Color(0xFF382D27),
                  Color(0xFF302720),
                ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
              ),
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if (state is SignupInitial) {
                    return Form(
                      key: key,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.15,
                          ),
                          //title
                          Title_of_App(
                              height: height,
                              width: width,
                              font_Size: height * 0.05),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          //this is the first Name or Second Name Here
                          FirstSecondName(
                            height: height,
                            width: width,
                            nameController: nameController,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Login_Email(
                            height: height,
                            width: width,
                            emailController: emailController,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          password(
                              height: height,
                              width: width,
                              passwordController: passwordController),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          //this is the Sign UP Up Button
                          InkWell(
                            onTap: () {
                              if (key.currentState!.validate()) {
                                SignUpEventProvider.add(
                                  SignUPEvent(
                                      name: nameController.text,
                                      email: emailController.text,
                                      newpassword: passwordController.text),
                                );
                                FocusManager.instance.primaryFocus!.unfocus();
                              }
                            },
                            child: CustomeBtn(
                              height: height,
                              width: width,
                              btn_Name: 'Sign Up',
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                        ],
                      ),
                    );
                  } else if (state is SignupLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SignupLoadedState) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Login_Screen();
                        },
                      ));
                    });
                    SignUpEventProvider.add(SignupRefreshEvent());
                    return SizedBox();
                  } else if (state is SignupErrorState) {
                    return Text('Error State');
                  } else {
                    return Text('kjjkhghghggjhgh');
                  }
                },
              ))),
    ));
  }
}
