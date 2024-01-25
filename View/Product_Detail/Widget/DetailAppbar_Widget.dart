import 'package:flutter/material.dart';

import '../../../Base/Constant.dart';

class ProductDetailAppbar extends StatelessWidget {
  ProductDetailAppbar({super.key, required this.title});

  String? title;

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.ltr,
    child: SizedBox(
          height: 46,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icon_apple_blue.png'),
            ),
            title: Text(title??'', textAlign: TextAlign.center),
            centerTitle: true,
            actions: [Image.asset('assets/images/icon_back.png')],
            titleTextStyle: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: MyColor.blue, fontWeight: FontWeight.w700),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
  );
}
