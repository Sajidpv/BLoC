import 'package:bloc_tutorial/bloc/screens/welcome/welcom_screen.dart';
import 'package:bloc_tutorial/cubit/cubits/cubit/internet_cubit.dart';
import 'package:bloc_tutorial/cubit/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHomeScreen extends StatelessWidget {
  const CubitHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomScreen()));
              }
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: BlocProvider.of<AuthCubit>(context).logOut,
                  icon: Icon(Icons.logout_rounded));
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          listener: (context, state) {
            if (state == InternetCubitState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Cubit Internet is connected',
                ),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetCubitState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Cubit Internet is disconnected',
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            return Text(state == InternetCubitState.gained
                ? 'Cubit Connected'
                : state == InternetCubitState.lost
                    ? 'Cubit Disconnected'
                    : 'Cubit Loading');
          },
        ),
      ),
    );
  }
}
