import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class SelectWat extends StatelessWidget {
  SelectWat({super.key, required this.wat,required this.index,required this.selected});

  String wat;
  int index;
  int selected;

  @override
  Widget build(BuildContext context) {
    return _getItem(wat, context, index);
  }

  _getItem(String sortName, BuildContext context, int index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 26,
        width: 74,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selected == index ? MyColor.blue : MyColor.gray,width: selected == index ? 2 : 0.5)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              sortName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: MyColor.gray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
}