import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 46,
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    child: Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'جستجوی محصولات',
          contentPadding: const EdgeInsets.all(0),
          hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: MyColor.gray,fontWeight: FontWeight.w700),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icon_apple_blue.png'),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 11),
            child: Image.asset('assets/images/icon_search.png'),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent,
                width: 0
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: MyColor.blue,
            ),
          )
        ),
      ),
    )
  );
}

// AppBar(
// backgroundColor: Colors.white,
// actions: [
// Image.asset('assets/images/icon_apple_blue.png'),
// const SizedBox(width: 6,),
// ],
// title: Text('جستجوی محصولات',textAlign: TextAlign.center),
// centerTitle: true,
// titleTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: MyColor.gray,fontWeight: FontWeight.w700),
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(15))),
// ),
