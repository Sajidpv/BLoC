import 'package:bloc_tutorial/cubit/screens/auth/cubit/auth_cubit.dart';
import 'package:bloc_tutorial/cubit/screens/cubit_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationScreen extends StatelessWidget {
  PhoneVerificationScreen({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Mobile Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLength: 6, keyboardType: TextInputType.number,
              controller: otpController,
              // onChanged: (value) => BlocProvider.of<AuthBloc>(context).add(
              //     SigninTextChangedEvent(
              //         emailController.text, passwordController.text)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter 6 digit OTP',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggeInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CubitHomeScreen()));
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
                    String otp = otpController.text;
                    BlocProvider.of<AuthCubit>(context).verifyOtp(otp);
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Verify OTP',
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
