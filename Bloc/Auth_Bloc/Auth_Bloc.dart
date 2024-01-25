
import 'package:apple_store/Bloc/Auth_Bloc/Auth_Event.dart';
import 'package:apple_store/Bloc/Auth_Bloc/Auth_State.dart';
import 'package:bloc/bloc.dart';
import '../../Model/Repository/AuthRepository.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {
  AuthRepository authRepository;
  AuthBloc(this.authRepository):super(AuthInitState()){

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoadingState(true));
      var response = await authRepository.registerUser(event.username, event.password, event.passwordConfirm);
      emit(AuthLoadingState(false));
      emit(AuthRegisterResponseState(response));
    });

    on<AuthLoginEvent>((event,emit) async {
      emit(AuthLoadingState(true));
      var response = await authRepository.loginUser(event.username, event.password);
      emit(AuthLoadingState(false));
      emit(AuthLoginState(response));
    });

  }
}