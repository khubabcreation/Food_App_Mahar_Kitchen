import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooood/lib/Screeen/Login_Screen.dart';
import 'package:fooood/lib/Screeen/Post_Screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  void login(
    BuildContext context,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool? check = pref.getBool('islogin');
    if (check == null) {
      Timer(Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login_Screen(),
            ));
      });
    } else if (check == true) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostScreen(),
            ));
      });
    }
  }
}
