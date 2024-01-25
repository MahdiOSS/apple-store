import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Model/DataClass/Product_Variant.dart';

class SelectColor extends StatelessWidget {
  SelectColor({super.key, required this.colors,required this.index,required this.selected});

  ProductColorVariant colors;
  int index;
  int selected;

  @override
  Widget build(BuildContext context) {
    return _getItem(colors.name ?? '', HexColor(colors.value ?? ''), context, index);
  }

  _getItem(String colorName, Color color, BuildContext context, int index) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 26,
          padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 15,
              right: selected == index ? 31.0 : 12.0),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Text(
            selected == index ? colorName : '',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color:MyColor.white),
            textAlign: TextAlign.end,
          ),
        ),
      );
}
