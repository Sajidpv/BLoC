import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SigninTextChangedEvent>((event, emit) {
      if (event.email == "" || EmailValidator.validate(event.email) == false) {
        emit(AuthErrorState("Please enter a valid email"));
      } else if (event.password.length < 8) {
        emit(AuthErrorState("Please enter a valid password "));
      } else {
        emit(AuthValidState());
      }
    });

    on<SigninSubmittedEvent>((event, emit) {
      emit(AuthLoadingState());
    });
  }
}
