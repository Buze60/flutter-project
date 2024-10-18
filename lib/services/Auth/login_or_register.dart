import 'package:flutter/material.dart';
import 'package:pro/pages/login_page.dart';
import 'package:pro/pages/register.dart';

/*
  LOGIN OR REGISTER PAGE

  this page is determine to show the login or the register page

 */
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the login page.
  bool showLoginPage = true;
  //toggle between the login & register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}
