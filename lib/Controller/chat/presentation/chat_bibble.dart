import 'package:dbumms_app/Controller/chat/model/message.dart';
import 'package:flutter/material.dart';

class ChatBibble extends StatelessWidget {
  final Message message;
  const ChatBibble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding:const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: message.isUser? Colors.green:Colors.grey,
        ),
        child: Text(message.content,style: TextStyle(color: message.isUser? Colors.white:Colors.black),)),
    );
  }
}
