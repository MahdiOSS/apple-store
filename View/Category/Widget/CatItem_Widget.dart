import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:flutter/material.dart';

class CategoryItem_Widget extends StatelessWidget {
  CategoryItem_Widget({super.key, required this.img});

  String img;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: 160,
        height: 160,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                  child: ImageLoader(
                imageUrl: img,
                fit: BoxFit.cover, placeholder: Container(),
              ))),
        ),
      );
}
