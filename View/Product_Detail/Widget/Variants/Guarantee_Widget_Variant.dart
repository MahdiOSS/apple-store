import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class SelectGuarantee extends StatelessWidget {
  SelectGuarantee({super.key, required this.guarantee,required this.index,required this.selected});

  String guarantee;
  int index;
  int selected;

  @override
  Widget build(BuildContext context) {
    return _getItem(guarantee, context, index);
  }

  _getItem(String sortName, BuildContext context, int index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 26,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selected == index ? MyColor.blue : MyColor.gray,width: selected == index ? 2 : 0.5)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 6,right: 6),
            child: Text(
              sortName.toString(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: MyColor.gray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
}