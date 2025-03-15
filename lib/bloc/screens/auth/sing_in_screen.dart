import 'package:bloc_tutorial/bloc/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthErrorState) {
                  return Text(
                    state.error,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              onChanged: (value) => BlocProvider.of<AuthBloc>(context).add(
                  SigninTextChangedEvent(
                      emailController.text, passwordController.text)),
              decoration: InputDecoration(
                hintText: 'Email address',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) => BlocProvider.of<AuthBloc>(context).add(
                  SigninTextChangedEvent(
                      emailController.text, passwordController.text)),
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if (state is AuthValidState) {
                      BlocProvider.of<AuthBloc>(context).add(
                          SigninSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                  color: state is AuthValidState
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
