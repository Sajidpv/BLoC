import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_tutorial/bloc/bloc/internet_bloc.dart';
import 'package:bloc_tutorial/bloc/screens/auth/bloc/auth_bloc.dart';
import 'package:bloc_tutorial/cubit/cubits/cubit/internet_cubit.dart';
import 'package:bloc_tutorial/cubit/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;

  const BlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getBlocProviders(context),
      child: child,
    );
  }

  List<BlocProvider> getBlocProviders(BuildContext context) {
    return [
      BlocProvider<InternetBloc>(create: (context) => InternetBloc()),
      BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      BlocProvider<PostCubit>(create: (context) => PostCubit()),
    ];
  }
}
