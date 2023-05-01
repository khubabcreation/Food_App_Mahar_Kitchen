import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FirstSecondName extends StatefulWidget {
  FirstSecondName(
      {required this.nameController,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  double height;
  double width;
  TextEditingController nameController;

  @override
  State<FirstSecondName> createState() => _FirstSecondNameState();
}

class _FirstSecondNameState extends State<FirstSecondName> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.width * 0.01),
            child: SizedBox(
              width: widget.width * 0.44,
              child: TextFormField(
                validator: RequiredValidator(errorText: '*Required'),
                controller: widget.nameController,
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  hintText: 'First Name',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellowAccent, width: 2.0),
                  ),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.width * 0.01),
            child: SizedBox(
              width: widget.width * 0.44,
              child: TextFormField(
                validator: RequiredValidator(errorText: '*Required'),
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  hintText: 'Second Name',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellowAccent, width: 2.0),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
