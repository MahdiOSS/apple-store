import 'dart:ui';
import 'package:apple_store/Base/Constant.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  BottomNavigationView({super.key});

  int selected= 0;

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
                selectedLabelStyle: Theme.of(context).textTheme.titleLarge,
                fixedColor: MyColor.blue,
                elevation: 0,
                onTap: (int index){
                  setState(() {
                     widget.selected = index;
                  });
                },
                currentIndex: widget.selected,
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/icon_profile.png'),
                      ),
                      activeIcon:
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent,
                                    blurRadius: 50,
                                    offset: Offset(0, 25),
                                    spreadRadius: -3
                                  )
                                ]
                              ),
                                child: const Icon(Icons.person_rounded,size:26,)),
                          ),
                      label: 'حساب کاربری',
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/icon_basket.png'),
                      ),
                      activeIcon:
                          Padding(
                            padding:const EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueAccent,
                                          blurRadius: 36,
                                          offset: Offset(0, 25),
                                          spreadRadius: -3
                                      )
                                    ]
                                ),
                                child: Image.asset('assets/images/icon_basket_active.png')),
                          ),
                      label: 'سبد خرید',
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/icon_category.png'),
                      ),
                      activeIcon:
                          Padding(
                            padding:const EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueAccent,
                                          blurRadius: 36,
                                          offset: Offset(0, 25),
                                          spreadRadius: -3
                                      )
                                    ]
                                ),
                                child: Image.asset('assets/images/icon_category_active.png')),
                          ),
                      label: 'دسته بندی'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/icon_home.png'),
                      ),
                      activeIcon:
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueAccent,
                                          blurRadius: 36,
                                          offset: Offset(0, 25),
                                          spreadRadius: -3
                                      )
                                    ]
                                ),
                                child: Image.asset('assets/images/icon_home_active.png')),
                          ),
                      label: 'خانه')
                ]),
          ),
        ),
      );
}
