import 'package:flutter/material.dart';
class GoogleIcon extends StatefulWidget {
    GoogleIcon({required this.height,required this.widht,Key? key}) : super(key: key);
  double height ;
  double widht;
  @override
  State<GoogleIcon> createState() => _GoogleIconState();
}

class _GoogleIconState extends State<GoogleIcon> {
  @override
  Widget build(BuildContext context) {
    return    CircleAvatar(
      backgroundColor: Color(0xFFCAA21E),
      radius: widget.height * 0.03,
      child: SizedBox(
          height: 32,
          width: 32,
          child: Image(
            image: AssetImage('Images/glogo.png'),
          )),
    );
  }
}
