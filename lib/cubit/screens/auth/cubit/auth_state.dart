part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthCodeSentState extends AuthState {}

final class AuthVerifiedState extends AuthState {}

final class AuthLoggeInState extends AuthState {
  // final FirebaseUser user;
  final bool user;

  AuthLoggeInState(this.user);
}

final class AuthLoggedOutState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}
