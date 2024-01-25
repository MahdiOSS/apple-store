import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    double scale = 1.0;
    double w = 120;
    double h = 60;
    return ElevatedButton(
        onLongPress: () {
          setState(() {
            scale = 2;
            w = w / 1.5;
            h = h / 1.5;
          });
        },
        onPressed: () {
          setState(() {
            scale = 2;
            w = w / 1.5;
            h = h / 1.5;
          });
        },
        child: Container(
          color: Colors.green,
          width: w,
          height: h,
        ));
  }
}
