import 'package:flutter/material.dart';
import 'package:pro/component/my_button.dart';
import 'package:pro/component/my_loading_circle.dart';
import 'package:pro/component/my_text_field.dart';
import 'package:pro/services/Auth/auth_get.dart';
import 'package:pro/services/Auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  bool _isPasswordVisible = false; // To toggle password visibility

  void login() async {
    try {
      showLoadingCircle(context);
      await _auth.loginEmailPassword(emailController.text, pwController.text);

      if (!mounted) return; // Check if the widget is still mounted

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthGet(toggleTheme: () {}),
        ),
      );
    } catch (e) {
      if (!mounted) return; // Check if the widget is still mounted

      hideLoadingCircle(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  // Adjust image size
                  Image.asset(
                    'assets/img/login_img.jpg',
                    height: 200, // Adjust the height to fit the screen
                  ),
                  const SizedBox(height: 15),
                  Icon(
                    Icons.lock_open,
                    size: 75,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Welcome to ESSGI",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter Email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // Password field with visibility toggle
                  TextField(
                    controller: pwController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyButton(text: "Login", onTap: login),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "  Register Now",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
