import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/home_page.dart';
import 'package:pro/services/Auth/login_or_register.dart';
/*
    AUTH GET
    this is to check if the user is log in or not
  _____________________________________________________________
    - if  user is logged in  -> go to the home page
    - if  user is not logged in -> go to the register page
 */

class AuthGet extends StatelessWidget {
  const AuthGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return const HomePage();
            }
            //user is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
