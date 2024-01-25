import 'package:flutter/material.dart';

getDialog(c,String title) async {
  await Future.delayed(const Duration(seconds: 1));
  await showDialog<void>(builder: (context) =>
      AlertDialog(
        title: Text(title, style: Theme
            .of(c)
            .textTheme
            .headlineMedium,),
      ), context: c);
}