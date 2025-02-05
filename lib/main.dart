import 'package:dbumms_app/Controller/chat/presentation/chat_page.dart';
import 'package:dbumms_app/Controller/chat/presentation/chat_provider.dart';
import 'package:dbumms_app/View/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ChatProvider(),
    child: const TicketApp(),
  ));
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}
  