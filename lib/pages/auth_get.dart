import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/home_page.dart';
import 'package:pro/services/Auth/login_or_register.dart';

/*
    AUTH GET
    This is to check if the user is logged in or not
  _____________________________________________________________
    - if  user is logged in  -> go to the home page
    - if  user is not logged in -> go to the register page
 */

class AuthGet extends StatelessWidget {
  final VoidCallback toggleTheme; // Add toggleTheme as a parameter

  const AuthGet({super.key, required this.toggleTheme}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // User is logged in
            if (snapshot.hasData) {
              return HomePage(
                toggleTheme: toggleTheme,
                uid: '',
              ); // Pass toggleTheme here
            }
            // User is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
