
import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Widget/MyDivider.dart';
import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  DividerSection({super.key,required this.title});

  String title;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineMedium,),
        MyDivider(color: Colors.grey.withOpacity(0.4), width: 100),
        Row(
          children: [
            Text('مشاهده همه',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColor.blue),),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 10),
              child: Image.asset('assets/images/icon_left_categroy.png',width: 20,height: 20,),
            )
          ],
        )
      ],
    ),
  );
}
