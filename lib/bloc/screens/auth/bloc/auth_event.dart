part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SigninTextChangedEvent extends AuthEvent {
  final String email;
  final String password;

  SigninTextChangedEvent(this.email, this.password);
}

class SigninSubmittedEvent extends AuthEvent {
  final String email;
  final String password;

  SigninSubmittedEvent(this.email, this.password);
}
