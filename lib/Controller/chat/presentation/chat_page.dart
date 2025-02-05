import 'package:dbumms_app/Controller/chat/presentation/chat_bibble.dart';
import 'package:dbumms_app/Controller/chat/presentation/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Top section:Chat message
            Expanded(child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                //empty..
                if (chatProvider.message.isEmpty) {
                  return const Center(
                    child: Text("Start Conver..."),
                  );
                }

                //chat messages
                return ListView.builder(
                  itemCount: chatProvider.message.length,
                  itemBuilder: (context, index) {
                    //get each message
                    final message = chatProvider.message[index];

                    //retun message
                    return ChatBibble(message: message);
                  },
                );
              },
            )),
            //USER IMPUT BOX
            Row(
              children: [
                //left Text box
                Expanded(child: TextField(
                  controller: _controller,
                )),

                //Right send button
                IconButton(onPressed: (){
                  if(_controller.text.isNotEmpty){
                    final chatProvider = context.read<ChatProvider>();
                    chatProvider.sendMessage(_controller.text);
                    _controller.clear();
                  }
                }, icon:const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
