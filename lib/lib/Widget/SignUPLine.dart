import 'package:flutter/material.dart';

import '../Screeen/SignUp_Screen.dart';

class SignUpLine extends StatefulWidget {
  SignUpLine({required this.height, required this.width, Key? key})
      : super(key: key);
  double height;
  double width;

  @override
  State<SignUpLine> createState() => _SignUpLineState();
}

class _SignUpLineState extends State<SignUpLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have an Account ? ',
            style: TextStyle(color: Colors.white70),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ));
                //********this is the text Button
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
