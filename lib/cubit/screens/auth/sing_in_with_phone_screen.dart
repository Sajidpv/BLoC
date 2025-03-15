import 'package:bloc_tutorial/cubit/screens/auth/cubit/auth_cubit.dart';
import 'package:bloc_tutorial/cubit/screens/auth/phone_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInWithPhoneScreen extends StatelessWidget {
  SingInWithPhoneScreen({super.key});
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Phone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<AuthCubit, AuthState>(
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
              maxLength: 10, keyboardType: TextInputType.phone,
              controller: phoneController,
              // onChanged: (value) => BlocProvider.of<AuthBloc>(context).add(
              //     SigninTextChangedEvent(
              //         emailController.text, passwordController.text)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Phone number',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneVerificationScreen()));
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.error,
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(milliseconds: 2000),
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CupertinoButton(
                  onPressed: () {
                    String phoneNumber = '+91${phoneController.text}';
                    BlocProvider.of<AuthCubit>(context).sentOtp(phoneNumber);
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Get OTP',
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
