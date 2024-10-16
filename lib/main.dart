import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro/firebase_options.dart';
import 'package:pro/pages/auth_get.dart';
import 'package:pro/pages/login_page.dart';
import 'package:pro/services/database/database_provider.dart';
import 'package:pro/theme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      ChangeNotifierProvider(create: (context) => DatabaseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return MaterialApp(
      title: 'Maintenance Tracker',
      theme: themeProvider.themeData,
      home: AuthGet(
          toggleTheme:
              themeProvider.toggleTheme), // Ensure toggleTheme is passed
      debugShowCheckedModeBanner: false,

      routes: {'/login': (context) => LoginPage(onTap: () {})},
    );
  }
}
