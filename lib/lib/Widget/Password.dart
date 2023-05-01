import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class password extends StatefulWidget {
   password({this.passwordController,required this.height,required this.width,Key? key}) : super(key: key);
  double height;
  double width ;
  TextEditingController? passwordController ;
  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: TextFormField(
        validator: RequiredValidator(errorText: 'Invalid password'),
        controller: widget.passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.white, fontSize: 22),
        decoration: InputDecoration(

          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          prefixIcon: Icon(
            Icons.key,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                //*********************Icon Button
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              )),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellowAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
