import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/View/Home/Widget/AppBar_Widget.dart';
import 'package:apple_store/View/Profile/Widget/ProfileItem_Widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  dynamic cat;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(child: _getBody(context)),
      );

  _getBody(BuildContext context) =>
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 32),
                  child: AppBarWidget(title: 'حساب کاربری'),
                ),
                Text(
                  'محمد مهدی اژدرزاده',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '0991 700 1086',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: MyColor.gray),
                ),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ProfileItem(
                            category:cat, index: index,
                          ),
                      itemCount: 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('اپل استور', style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),),
                Text('V1.0.01', style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),),
                Text('Designer: My freand MoJavad', style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),),
                const SizedBox(height: 32,)
              ],
            )
          ],
        ),
      );
}
