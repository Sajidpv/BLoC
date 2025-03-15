import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { initial, gained, lost }

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  InternetCubit() : super(InternetCubitState.initial) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi)) {
        emit(InternetCubitState.gained);
      } else {
        emit(InternetCubitState.lost);
      }
    });
  }
  @override
  Future<void> close() async {
    await connectivitySubscription.cancel();
    return super.close();
  }
}
