import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({super.key});

  @override
  Widget build(BuildContext context) => const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.all(20.0),
        child: SizedBox(
          width: 24,
            height: 24,
            child: CircularProgressIndicator(
              color: MyColor.green,
            )),
      ),
    ],
  );
}
