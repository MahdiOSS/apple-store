import 'dart:developer';

import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Widget/MyDivider.dart';
import 'package:apple_store/Model/DataClass/Properties.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({super.key,required this.title,required this.properties,required this.selected});
  String title;
  List<Properties> properties;
  bool selected;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: AnimatedContainer(
      clipBehavior: Clip.none,
      height: widget.selected ? 450 : 47,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: MyColor.gray, width: widget.selected ? 0.5 : 0.01),
          color: Colors.white60),
      duration: const Duration(milliseconds: 300),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selected = !widget.selected;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: MyColor.gray, width: widget.selected ? 0.5 : 1.0),
                color: Colors.white,
              ),
              height: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'مشاهده',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: MyColor.blue),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AnimatedRotation(
                        turns: widget.selected ? -90 / 360 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                            'assets/images/icon_left_categroy.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if (widget.selected)
            _getPropertiesWidget()
        ],
      ),
    ),
  );

  _getPropertiesWidget(){
    log(widget.properties.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.properties.length,itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.properties[index].title!,style: Theme.of(context).textTheme.headlineSmall?.copyWith()),
                  SizedBox(child: Text(widget.properties[index].value ?? '',style: Theme.of(context).textTheme.headlineSmall?.copyWith()),width: 200,),
                ],
              ),
              MyDivider(color: MyColor.blue, width: 0.5)
            ],
          ),
        );
      }),
    );
  }

}
