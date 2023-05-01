import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../Models/SignUp_Model_Class.dart';

abstract class SignupEvent {}

class SignUPEvent extends SignupEvent {
  String name;
  String email;
  String newpassword;

  SignUPEvent(
      {required this.name, required this.email, required this.newpassword}) {}
}

class SignupRefreshEvent extends SignupEvent{

}
