import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  ProfileItem({super.key,required this.category,required this.index});

  CategoryItem category;
  int index;

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  int selected = 0;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            selected = widget.index;
          });
        },
        child: Column(
          children: [
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(0),
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              shadowColor: Color(widget.category.background_color as int),
              child: AnimatedContainer(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 400),
                width: widget.category.icon_size?.toDouble() ?? 56.0,
                height: widget.category.icon_size?.toDouble() ?? 56.0,
                decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                          color: Color(widget.category.background_color as int),
                          blurRadius: 1,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(0.0,4)
                      )
                    ],
                    color: Color(widget.category.background_color as int),
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(widget.category.icon_category ?? '',fit: BoxFit.cover,width: 30.0,height: 30.0,),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.category.name_category ?? '',style: Theme.of(context).textTheme.headlineSmall)
          ],
        ),
      ),
    ),
  );
}
