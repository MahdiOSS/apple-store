import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Bloc.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Event.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_State.dart';
import 'package:apple_store/View/Auth/WidgetFromState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var controller = TextEditingController(text: 'abolfazl');
  var controller2 = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _getFiled('User Name', context, false, Icons.person_rounded,controller),
          _getFiled('Password', context, true, Icons.password_rounded,controller2),
          const SizedBox(
            height: 10,
          ),
          _getSubmitButton(context),
          const SizedBox(
            height: 10,
          ),
        ],
      );

  _getFiled(String label, BuildContext context, bool password, IconData icon,TextEditingController controller) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: MyColor.white),
            keyboardType:
                password ? TextInputType.visiblePassword : TextInputType.text,
            decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      icon,
                      color: MyColor.white,
                    )
                  ],
                ),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: MyColor.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.white70, width: 2))),
          ),
        ),
      );

  _getSubmitButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          _loginUser(controller.text, controller2.text, context);
        },
        child: BlocBuilder<AuthBloc,AuthState>(builder: (context,state) => getWidgetFromState(state, context,'ورود'),),
      );
  
  _loginUser(String username,String password,BuildContext context){
    BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(password, username));
  }
}
