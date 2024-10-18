import 'package:flutter/material.dart';
import 'package:pro/component/my_loading_circle.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_service.dart';

import '../component/my_button.dart';
import '../component/my_text_field.dart';

/*
    REGISTER PAGE
    on this page user can fill the form and create an account. 
    the data we want from the user is 
    -name 
    -email 
    -password 
    -confirm password 
   _________________________________________________________ 
   once the user successfully create an account ->the will be redirected to the home page. 

   also if the user had an account, they go to the login page from here. 

 */
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
//access the auth & db service
  final _auth = AuthService();
  final _db = DatabaseService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwlController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  // Register button Tap
  void register() async {
    //password match -> create user
    if (pwlController.text == confirmPwController.text) {
      //attempt to register
      try {
        //show loading circle
        showLoadingCircle(context);
        //try to register
        await _auth.registerEmailPassword(
            emailController.text, pwlController.text);
        //finished loading...
        if (mounted) hideLoadingCircle(context);
        //once registered, create and save user profile in the database
        await _db.saveUserInfoInFirebase(
            name: nameController.text,
            role: roleController.text,
            email: emailController.text);
      } catch (e) {
        //finished loading...
        if (mounted) {
          hideLoadingCircle(context);
        }
        // let know the user couse of error
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      }
    }

    //password don't match -> show error
    else {
      showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(title: Text("password don't match")));
    }
  }

  //BUILD UI
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
                  //sized box
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.lock_open,
                    size: 75,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 50),
                  //wellcome text
                  Text(
                    "create an account",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  //name text field
                  MyTextField(
                      controller: nameController,
                      hintText: "Enter name",
                      obscuretext: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //email text field
                  MyTextField(
                      controller: emailController,
                      hintText: "Enter Email",
                      obscuretext: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //password text feild
                  MyTextField(
                      controller: pwlController,
                      hintText: "Enter your password",
                      obscuretext: true),
                  const SizedBox(
                    height: 10,
                  ),
                  //confirm password text feild
                  MyTextField(
                      controller: confirmPwController,
                      hintText: "Comfirm your password",
                      obscuretext: true),
                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(text: "Register", onTap: register),
                  const SizedBox(height: 50),
                  // Already a member ? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      //user can tap this to go the login page
                      GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            " Login Now",
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
