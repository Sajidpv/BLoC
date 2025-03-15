import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint("Created : $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change in $bloc: $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Transition in $bloc: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Closed: $bloc');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error in $bloc:Error is $error : On $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
