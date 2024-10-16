import 'package:flutter/material.dart';
import 'package:pro/pages/home_page.dart';

import 'history_page.dart';
import 'new_request_page.dart'; // Import your new pages
import 'status_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maintenance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              toggleTheme: () {},
              uid: '',
            ), // Remove 'const'
        '/new-request': (context) => NewRequestPage(), // Remove 'const'
        '/history': (context) => HistoryPage(), // Remove 'const'
        '/status': (context) => StatusPage(), // Remove 'const'
      },
    );
  }
}
