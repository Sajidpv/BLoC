part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthValidState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}
