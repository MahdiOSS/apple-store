import 'package:flutter/material.dart';

import '../../Base/Constant.dart';
import '../../Bloc/Auth_Bloc/Auth_State.dart';
import 'Custom_Dialog.dart';

Widget getWidgetFromState(AuthState state,BuildContext context,String title) {
  if(state is AuthInitState) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: MyColor.white));
  }
  if(state is AuthLoadingState) {
    return Visibility(visible: state.enable,child: CircularProgressIndicator(color: MyColor.white,));
  }
  if(state is AuthRegisterResponseState) {
    String message = '';
    state.response.fold((l) async => await getDialog(context, l), (r) => message = ' خوش آمدید !${r.username}');
    return Text(message);
  }
  if(state is AuthLoginState){
    String message = '';
    state.response.fold((l) async => await getDialog(context, l), (r) => message = ' خوش آمدید !${r.username}');
    return Text(message);
  }
  return Text('خطا',
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: MyColor.white));
}