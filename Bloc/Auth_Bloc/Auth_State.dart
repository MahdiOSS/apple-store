
import 'package:apple_store/Model/DataClass/User.dart';
import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {
  bool enable;
  AuthLoadingState(this.enable);
}

class AuthRegisterResponseState extends AuthState {
  Either<String,User> response;
  AuthRegisterResponseState(this.response);
}

class AuthLoginState extends AuthState {
  Either<String,User> response;
  AuthLoginState(this.response);
}