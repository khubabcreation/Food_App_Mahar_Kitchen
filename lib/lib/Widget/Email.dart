import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login_Email extends StatefulWidget {
  Login_Email(
      {this.emailController,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  double height;

  double width;

  TextEditingController? emailController;

  @override
  State<Login_Email> createState() => _Login_EmailState();
}

class _Login_EmailState extends State<Login_Email> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: TextFormField(
        validator: MultiValidator([
          RequiredValidator(errorText: 'Required'),
          EmailValidator(errorText: 'Invalid Email')
        ]),
        controller: widget.emailController,
        style: TextStyle(color: Colors.white, fontSize: 22),
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellowAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
