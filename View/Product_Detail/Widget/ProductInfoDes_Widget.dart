import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class ProductInfoDec extends StatefulWidget {
  ProductInfoDec({super.key, required this.title, required this.content,required this.selected});

  String title;
  String content;
  bool selected;

  @override
  State<ProductInfoDec> createState() => _ProductInfoDecState();
}

class _ProductInfoDecState extends State<ProductInfoDec> {

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        clipBehavior: Clip.none,
        height: widget.selected ? 350 : 47,
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
                duration: const Duration(milliseconds: 500),
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
              _getContentProduct(widget.content)
          ],
        ),
      );

  _getContentProduct(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 60),
      child: Text(
        content,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
