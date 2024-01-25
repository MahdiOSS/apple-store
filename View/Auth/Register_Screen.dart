import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Bloc.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Event.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_State.dart';
import 'package:apple_store/View/Home/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'WidgetFromState.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key,required this.bloc});

  AuthBloc bloc;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController(text: '12345678');

  TextEditingController passwordConfirm = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _getFiled(
              'نام کاربری', context, false, Icons.person_add_rounded, username),
          _getFiled(
              'رمز عبور', context, true, Icons.password_rounded, password),
          _getFiled('تکرار رمز عبور', context, true, Icons.repeat_rounded,
              passwordConfirm),
          const SizedBox(
            height: 4,
          ),
          _getSubmitButton(context),
          const SizedBox(
            height: 10,
          ),
        ],
      );

  _getFiled(String label, BuildContext context, bool password, IconData icon,
          TextEditingController controller) =>
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
                    ),
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

  _getSubmitButton(BuildContext buildContext) => FloatingActionButton(
        onPressed: () async {
          await _registerUser(buildContext);
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => getWidgetFromState(state,buildContext,'تایید'),
        ),
      );

  _registerUser(BuildContext context) async {
    widget.bloc.add(
        AuthRegisterEvent(username.text, password.text, passwordConfirm.text));
  }
}
