
import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class ProductInfoComment extends StatelessWidget {
  ProductInfoComment({super.key,required this.title,required this.content});
  String title;
  String content;
  double padding = 15;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MyColor.gray),
          color: Colors.white,
        ),
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(title,style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(width: 8),
                SizedBox(
                  width: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      _getUserCommentItem(0.0),
                      _getUserCommentItem(15.0),
                      _getUserCommentItem(30.0),
                      _getUserCommentItem(45.0),
                      _getUserCommentItem(60.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text('مشاهده',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColor.blue),),
              const SizedBox(width: 10,),
              Image.asset('assets/images/icon_left_categroy.png'),
              const SizedBox(width: 10,)
            ],
          )
        ],
      ),
    ),
  );

  _getUserCommentItem(double padding) => Positioned(
    right: padding,
    child: SizedBox(
      width: 26,
      height: 26,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white)
        ),
      ),
    ),
  );

}
