import 'package:flutter/material.dart';

class Title_of_App extends StatefulWidget {
  Title_of_App(
      {required this.font_Size,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);
  double height;
  double font_Size;
  double width;

  @override
  State<Title_of_App> createState() => _Title_of_AppState();
}

class _Title_of_AppState extends State<Title_of_App> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text("Meher's  Kitchen ",
          style: TextStyle(
              color: Colors.yellowAccent.withOpacity(0.7),
              fontSize: widget.font_Size,
              fontFamily: 'Lobster',
              fontWeight: FontWeight.bold)),
    );
  }
}
