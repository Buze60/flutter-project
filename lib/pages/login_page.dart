// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pro/component/my_button.dart';
import 'package:pro/component/my_loading_circle.dart';
import 'package:pro/component/my_text_field.dart';
import 'package:pro/services/Auth/auth_services.dart';

/*
   Login page

   on this page an existing user can login with
      -eamil
      -password
  _____________________________________________________
  one the user login successfully the redirect to the home page

  if doesnt any account the redirected to the register page
 */
class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //access the auth service
  final _auth = AuthService();
  //Text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  //login methed
  void login() async {
    //try to login
    try {
      //loading page at the begging
      showLoadingCircle(context);
      //try to login
      await _auth.loginEmailPassword(emailController.text, pwController.text);
      //loading finished
      if (mounted) {
        hideLoadingCircle(context);
      }
    } catch (e) {
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  //BUID UI
  @override
  Widget build(BuildContext context) {
    //SCAFFOLD
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/login_img.jpg'),
                  //sized box
                  SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.lock_open,
                    size: 75,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 50),
                  //create an account
                  Text(
                    "Wellcome to ESSGI",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //email text field
                  MyTextField(
                      controller: emailController,
                      hintText: "Enter Email",
                      obscuretext: false),

                  const SizedBox(
                    height: 20,
                  ),
                  //password text feild
                  MyTextField(
                      controller: pwController,
                      hintText: "Enter your password",
                      obscuretext: true),
                  const SizedBox(
                    height: 25,
                  ),
                  //forget password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //sign in button
                  MyButton(text: "Login", onTap: login),
                  const SizedBox(height: 50),
                  // not register ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I don't  ahve an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      //user can tap this to go the register page
                      GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            " Register Now",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
