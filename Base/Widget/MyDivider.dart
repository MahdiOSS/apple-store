
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  Color color;
  double width;
  double height;
  MyDivider({super.key,required this.color, required this.width,this.height = 0.5});

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(100))
    ),
  );
}
