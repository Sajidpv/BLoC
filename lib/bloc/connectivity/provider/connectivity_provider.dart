// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class ConnectivityProvider with ChangeNotifier {
//   ConnectivityResult? currentConnectionStatus;
//   late StreamSubscription subscription;

//   ConnectivityProvider() {
//     _onInit();
//   }

//   void _onInit() {
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       currentConnectionStatus = result;
//       notifyListeners();
//     });
//   }

//   Future<bool> isInternetConnected() async {
//     final result = await Connectivity().checkConnectivity();
//     return result != ConnectivityResult.none;
//   }

//   ConnectivityResult? get connectivityResult => currentConnectionStatus;
// }
