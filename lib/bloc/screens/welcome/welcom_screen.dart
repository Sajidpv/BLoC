import 'package:bloc_tutorial/bloc/screens/auth/sing_in_screen.dart';
import 'package:bloc_tutorial/cubit/screens/auth/sing_in_with_phone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Expanded takes all available space
            Expanded(
              child: Center(
                child: Text(
                  'BLoC Example',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            // Aligns button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .9,
                child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Sign In With Email',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SingInScreen()),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .9,
                  child: CupertinoButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Sign In With Phone',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingInWithPhoneScreen()),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
