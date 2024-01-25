import 'dart:async';
import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int discount(int price, int dis) {
  double discount = price / 100 * dis;
  int disPrice = (price - discount).toInt();
  return disPrice;
}

void changeStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
  ));
}

void changeNavigationBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: color));
}

void hideSystemNavigationBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

String setPocketBaseUriImage(String img, dynamic json) {
  return '${BaseDomain.baseUrl}files/${json['collectionName']}/${json['id']}/${json[img]}';
}

void myDelay(int delay, Function() work) {
  Timer(Duration(milliseconds: delay), work);
}

void myPushNavigate (BuildContext context,Widget route) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
}
