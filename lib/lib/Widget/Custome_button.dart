import 'package:flutter/material.dart';

class CustomeBtn extends StatefulWidget {
  CustomeBtn({required this.btn_Name,required this.height, required this.width, Key? key})
      : super(key: key);
  double height;
  double width;
  String btn_Name;

  @override
  State<CustomeBtn> createState() => _CustomeBtnState();
}

class _CustomeBtnState extends State<CustomeBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.05,
      width: widget.width * 0.3,
      child: Center(
        child: Text(
          widget.btn_Name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          color: Color(0xFFCAA21E),
          borderRadius: BorderRadius.circular(widget.height * 0.1)),
    );
  }
}
