
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:apple_store/Base/Utils.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Bloc.dart';
import 'package:apple_store/View/Auth/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../Base/Constant.dart';
import 'Register_Screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}
enum SplashState {
  splash,register,login
}

class _Splash_ScreenState extends State<Splash_Screen> {

  var state = SplashState.splash;
  double height = 270;
  double turn = 0;
  double time = 40;

  bool click = false;
  @override
  void initState(){
    super.initState();
    changeStatusBarColor(Colors.blue);
    changeNavigationBarColor(MyColor.blue);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(Colors.blue);
    changeNavigationBarColor(MyColor.blue);
    return Scaffold(
      backgroundColor: MyColor.blue,
      body: SingleChildScrollView(
        child: Stack(
            children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.withOpacity(0.8), MyColor.blue])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: double.infinity),
                const SizedBox(height: 20),
                _getLogo(context),
                _getTitleLetsGo(context,BlocProvider.of<AuthBloc>(context))
              ],
            ),
          )
        ]),
      ),
    );
  }

  _getTitleLetsGo(BuildContext context,AuthBloc bloc) => AnimatedContainer(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 2 - 1,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/star.png'))),
        duration: const Duration(seconds: 1),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
             SizedBox(
               height: height,
               child: IndexedStack(
                 index: _getIndexState(state),
                 children: _getLayout(bloc),
               ),
             ),
              SizedBox(height: 10,),
              if (state.name != SplashState.splash.name) _getSwitch() else const SizedBox(),
              const SizedBox(height: 30,),
              _getOwner(context)
            ],
          ),
        ),
      );


  _getSplashTitle()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20,),
      Text('اوج هیجان',style: Theme.of(context).textTheme.displayLarge,),
      Text('با خرید محصولات',style: Theme.of(context).textTheme.displayLarge,),
      Text('اپل !',style: Theme.of(context).textTheme.displayLarge,),
      const SizedBox(height: 20,),
      _getGo(),
    ],
  );

  _getLogo(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColor.blueLow.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MyColor.blueLow.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyColor.blueLow.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: MyColor.blueLow.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  AnimatedRotation(
                    turns: turn,
                    alignment: Alignment.center,
                    filterQuality: FilterQuality.high,
                    curve: Curves.slowMiddle,
                    duration: Duration(seconds: time.toInt()),
                    child: Image.asset(
                      'assets/images/icon_application.png',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Apple Store',
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      );

  _getGo() => InkWell(
    onTap: (){
      setState(() {
        state = SplashState.register;
        turn = 1.0;
        time = 3;
      });
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: const Icon(Icons.arrow_back_ios_rounded),
      ),
    ),
  );

  _getOwner(BuildContext context) => Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('From',style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: MyColor.gray),),
        Text('MoJavad',style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: MyColor.white),)
      ],
    ),
  );

  List<Widget> _getLayout(AuthBloc bloc) => [
    _getSplashTitle(),
    RegisterScreen(bloc: bloc,),
    LoginScreen()
  ];

  _getIndexState(SplashState splashState) {
    switch(splashState){
      case SplashState.splash: return 0;
      case SplashState.register: return 1;
      case SplashState.login: return 2;
    }
  }

  var value = 0;

  _getSwitch() =>
      AnimatedToggleSwitch<int>.size(
        textDirection: TextDirection.rtl,
        current: value,
        values: const [0, 1],
        iconOpacity: 0.2,
        indicatorSize: const Size.fromWidth(100),
        borderWidth: 4.0,
        iconList: [
          Text('ثبت نام',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
          Text('ورود',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),
        ],
        iconAnimationType: AnimationType.onHover,
        style: ToggleStyle(
          backgroundColor: MyColor.blue,
          borderColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        styleBuilder: (i) => const ToggleStyle(indicatorColor: Colors.blue),
        onChanged: (i) => setState((){
          value = i;
          i == 0
              ? {
            state = SplashState.register,
            height = 270.0
          }
              : {
            state = SplashState.login,
            height = 220
          };
        }),
      );

}
