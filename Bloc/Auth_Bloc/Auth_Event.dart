abstract class AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  String username;
  String password;
  String passwordConfirm;
  AuthRegisterEvent(this.username,this.password,this.passwordConfirm);
}

class AuthLoginEvent extends AuthEvent {
  String username;
  String password;
  AuthLoginEvent(this.password,this.username);
}