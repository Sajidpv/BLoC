// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   final RxBool hasConnectivity = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(
//       ConnectivityResult connectivityResult) async {
//     if (connectivityResult == ConnectivityResult.none) {
//       print('lost');
//       hasConnectivity.value = false;
//       Get.rawSnackbar(
//         messageText: const Text(
//           'PLEASE CONNECT TO THE INTERNET',
//           style: TextStyle(color: Colors.white, fontSize: 14),
//         ),
//         isDismissible: false,
//         duration: const Duration(days: 1),
//         backgroundColor: Colors.red[400]!,
//         icon: const Icon(
//           Icons.wifi_off,
//           color: Colors.white,
//           size: 45,
//         ),
//         margin: EdgeInsets.zero,
//         snackStyle: SnackStyle.GROUNDED,
//       );
//     } else {
//       print('connection gained');
//       hasConnectivity.value = true;
//       if (Get.isSnackbarOpen) {
//         Get.closeAllSnackbars();
//       }
//     }
//   }
// }
