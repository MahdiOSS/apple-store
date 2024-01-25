/* Wrote by MohamadMahdi Azhdarzadeh */
import 'package:flutter/material.dart';

extension ParseNumberToString on int? {

  String parseNumberToStringWithComma() {
    if (this == null || this == 0) {
      return '0';
    }
    String fixPrice = '';
    int num = this!;
    List<String> characters = [];
    int d;
    while (num > 0) {
      d = num % 10;
      num = num ~/ 10;
      characters.add(d.toString());
    }

    for (var i = 0; i < characters.length; i++) {
      if (i % 3 == 0) {
        fixPrice += ',';
      }
      fixPrice += characters[i];
    }
    fixPrice = fixPrice.substring(1);
    fixPrice = fixPrice
        .split('')
        .reversed
        .join();

    return fixPrice;
  }

}