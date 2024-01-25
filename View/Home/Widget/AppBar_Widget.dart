
import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key,required this.title,this.titleColor = MyColor.blue});

  String title;
  Color titleColor;

  @override
  Widget build(BuildContext context) => Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icon_apple_blue.png'),
            ),
          title: Text(title,textAlign: TextAlign.center),
           centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: titleColor,fontWeight: FontWeight.w700),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      );
}
