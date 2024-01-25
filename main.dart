import 'dart:ui';
import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Fonts.dart';
import 'package:apple_store/Bloc/Category_Bloc/Category_Bloc.dart';
import 'package:apple_store/Bloc/Home_Bloc/Home_Bloc.dart';
import 'package:apple_store/Services/DI/di.dart';
import 'package:apple_store/View/Category/Category_Screen.dart';
import 'package:apple_store/View/Home/Home_Screen.dart';
import 'package:apple_store/View/Profile/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'Bloc/Cart_Bloc/Card_Bloc.dart';
import 'Model/DataClass/Card_Item.dart';
import 'View/Card/Card_Screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<CardItem>(CardItemAdapter());
  await Hive.openBox<CardItem>("card_item_box_db");
  //init Get it for ( Dependency injection )
  await initGetIt();
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int selectedScreen = 3;

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                displayLarge: getH1(),
                displayMedium: getH2(),
                displaySmall: getH3(),
                headlineLarge: getH4(),
                headlineSmall: getH5(),
                headlineMedium: getH6(),
                titleLarge: getH7())),
        home: Scaffold(
            bottomNavigationBar:
                true ? _getBottomNavigationView(context) : const SizedBox(),
            body: IndexedStack(
              index: selectedScreen,
              children: _getLayout(),
            )),
        debugShowCheckedModeBanner: false,
      );

  List<Widget> _getLayout() {
    return <Widget>[
      ProfileScreen(),
      BlocProvider(
          create: (BuildContext context) => di.get<CartBloc>(),
          child: CardScreen()),
      BlocProvider(
          create: (BuildContext context) => CategoryBloc(di.get()),
          child: const CategoryScreen()),
      BlocProvider(
          create: (BuildContext context) =>
              HomeBloc(di.get(), di.get(), di.get()),
          child: const HomeScreen())
    ];
  }

  _getBottomNavigationView(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                unselectedLabelStyle: getH7(),
                selectedLabelStyle: getH7(),
                fixedColor: MyColor.blue,
                elevation: 0,
                onTap: (int index) {
                  setState(() {
                    selectedScreen = index;
                  });
                },
                currentIndex: selectedScreen,
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/profile.png',width: 44,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 2.0,
                        ),
                        child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.blueAccent,
                                  blurRadius: 50,
                                  offset: Offset(0, 25),
                                  spreadRadius: -3)
                            ]),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 32,
                            )),
                      ),
                      label: 'حساب کاربری',
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/cart_active.png',width: 44,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset(
                            'assets/images/cart_active.png',width: 44,),
                      ),
                      label: 'سبد خرید',
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/icon_category.png'),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.blueAccent,
                                  blurRadius: 36,
                                  offset: Offset(0, 25),
                                  spreadRadius: -3)
                            ]),
                            child: Image.asset(
                                'assets/images/icon_category_active.png')),
                      ),
                      label: 'دسته بندی'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset('assets/images/home.png',width: 44,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Image.asset(
                            'assets/images/home_active.png',width: 44,),
                      ),
                      label: 'خانه')
                ]),
          ),
        ),
      );
}
