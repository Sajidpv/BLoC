import 'package:bloc_tutorial/bloc/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomeScreen extends StatelessWidget {
  const BlocHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'BLoC Internet is connected',
                ),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'BLoC Internet is disconnected',
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              return Text(state is InternetGainedState
                  ? 'BLoC Connected'
                  : state is InternetLostState
                      ? 'BLoC Disconnected'
                      : 'BLoC Loading');
            },
          ),
        ),
      ),
    );
  }
}
