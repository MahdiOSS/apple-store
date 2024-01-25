import 'dart:ui';

import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Extentions.dart';
import 'package:flutter/material.dart';

import '../../../Base/Utils.dart';

class CustomButtonProductDetailPrice extends StatelessWidget {
  CustomButtonProductDetailPrice(
      {super.key, required this.color, required this.price, required this.dis});

  Color color;
  int price;
  int dis;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 130,
            height: 47,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
          ),
          Positioned(
            top: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 150,
                  height: 47,
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.4),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price.parseNumberToStringWithComma(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: MyColor.white,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 4),
                          ),
                          Text(
                            discount(price, dis).parseNumberToStringWithComma(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'تومان',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: MyColor.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
