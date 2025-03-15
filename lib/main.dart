import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/presentation/screens/home_screen.dart';
import 'package:bloc_tutorial/bloc/screens/welcome/welcom_screen.dart';
import 'package:bloc_tutorial/bloc_observers.dart';
import 'package:bloc_tutorial/bloc_providers.dart';
import 'package:bloc_tutorial/config/system_configs.dart';
import 'package:bloc_tutorial/cubit/screens/auth/cubit/auth_cubit.dart';
import 'package:bloc_tutorial/cubit/screens/auth/sing_in_with_phone_screen.dart';
import 'package:bloc_tutorial/cubit/screens/cubit_home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(BlocProviders(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SELECTED_STATE_MANAGMENT_ENVIORNMENT ==
              STATE_MANAGMENT_ENVIORNMENT.bloc
          ? WelcomScreen()
          : SELECTED_STATE_MANAGMENT_ENVIORNMENT ==
                  STATE_MANAGMENT_ENVIORNMENT.dio
              ? HomeScreen()
              : BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) =>
                      previous is AuthInitialState,
                  builder: (context, state) {
                    if (state is AuthLoggeInState) {
                      return CubitHomeScreen();
                    } else if (state is AuthLoggedOutState) {
                      return SingInWithPhoneScreen();
                    }
                    return Scaffold();
                  },
                ),
    );
  }
}
