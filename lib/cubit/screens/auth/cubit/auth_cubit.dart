// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState()) {
    bool currentUser = false;
    // User? currentUser = _auth.currentUser;
    if (currentUser != true) {
      emit(AuthLoggedOutState());
    } else {
      emit(AuthLoggeInState(currentUser));
    }
  }
  // String? _verificationId;
  void sentOtp(String phone) async {
    emit(AuthLoadingState());
    // await _auth.verifyPhoneNumber(
    //     phoneNumber: phone,
    //     codeSent: (verificationId, forceResendingToken) {
    //       _verificationId = verificationId;
    //       emit(AuthCodeSentState());
    //     },
    //     verificationCompleted: (phoneAuthCredential) {
    //       signInWithPhone(phoneAuthCredential);
    //     },
    //     verificationFailed: (error) {
    //       emit(AuthErrorState(error.message.toString()));
    //     },
    //     codeAutoRetrievalTimeout: (verificationId) {
    //       _verificationId = verificationId;
    //     });
    if (phone.length < 13) {
      emit(AuthErrorState('Plese enter a valid phone'));
    } else {
      debugPrint('code: ${phone.padRight(6)}');
      emit(AuthCodeSentState());
    }
  }

  void verifyOtp(String otp) async {
    emit(AuthLoadingState());
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: _verificationId!, smsCode: otp);
    if (otp.length < 6) {
      emit(AuthErrorState('Plese enter valid otp'));
    } else {
      signInWithPhone('credential');
      // signInWithPhone(credential);
    }
  }

  // void signInWithPhone(PhoneAuthCredential credential) async {
  void signInWithPhone(String credential) async {
    try {
      // UserCredential userCredential =
      //     // await _auth.signInWithCredential(credential);
      // if (userCredential.user != null) {
      //   emit(AuthLoggeInState(true));
      // }
      emit(AuthLoggeInState(true));
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
    // } on FirebaseAuthException catch (ex) {
    //   emit(AuthErrorState(ex.message.toString()));
    // }
  }

  void logOut() async {
    // await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
