import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {Key? key,
      required this.name,
      required this.buttoncolor,
      required this.onpress,
      this.height,
      this.minwidth,
      this.shape,
      this.elevation,
      required this.textColor})
      : super(key: key);
  final name;
  final buttoncolor;
  final Future onpress;
  final textColor;
  final minwidth;
  final shape;
  final height;
  final elevation;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () async {
          final result = await onpress;

          if (result == null) {
            print("Failed Why ?");
          } else {
            print("success");
            print(result.uid);
          }
        },
        child: Text(name.toString()),
        color: buttoncolor,
        textColor: textColor,
        minWidth: minwidth,
        height: height,
        elevation: elevation,
        shape: shape);
  }
}
