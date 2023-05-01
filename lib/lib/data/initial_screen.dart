import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Bloc/Login_Bloc/login_bloc.dart';
import '../Widget/Custome_button.dart';
import '../Widget/Email.dart';
import '../Widget/Google_Icon.dart';
import '../Widget/Password.dart';
import '../Widget/SignUPLine.dart';
import 'package:provider/provider.dart';
import '../Widget/Sperater.dart';
import '../Widget/Title_Of_App.dart';

class Initial extends StatelessWidget {
  var validaionKey;
  Initial({required this.validaionKey, Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginEvent = Provider.of<LoginBloc>(context, listen: false);
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
        ),
        Title_of_App(height: height, width: width, font_Size: height * 0.05),
        SizedBox(
          height: height * 0.1,
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
        InkWell(
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setBool('islogin', true);
              if (validaionKey.currentState!.validate()) {
                loginEvent.add(click_Event(
                    email: emailController.text.toString(),
                    password: passwordController.text.toString()));

                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: CustomeBtn(
              height: height,
              width: width,
              btn_Name: 'Log In',
            )),
        SizedBox(
          height: height * 0.04,
        ),
        LineSeperater(
          height: height,
          width: width,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        GoogleIcon(height: height, widht: width),
        SignUpLine(height: height, width: width),
        SizedBox(
          height: height * .1,
        )
      ],
    );
  }
}
