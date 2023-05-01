import 'package:flutter/material.dart';

class LineSeperater extends StatefulWidget {
  LineSeperater({required this.width, required this.height, Key? key})
      : super(key: key);
  double height;
  double width;
  @override
  State<LineSeperater> createState() => _LineSeperaterState();
}

class _LineSeperaterState extends State<LineSeperater> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: widget.height * 0.002,
          width: widget.width * 0.3,
          decoration: BoxDecoration(
              gradient: (LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.white70]))),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
          child: Text(' Or ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          height: widget.height * 0.002,
          width: widget.width * 0.3,
          decoration: BoxDecoration(
              gradient: (LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.white70]))),
        ),
      ],
    );
  }
}
