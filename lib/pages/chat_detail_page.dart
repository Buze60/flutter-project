import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String chatName;

  const ChatDetailPage({super.key, required this.chatName});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.chatName, style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                messageBubble("Hello!", true, "October 8, 2024"),
                messageBubble("Hey there!", false, "October 8, 2024"),
                // Add more message bubbles here
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.grey),
                  onPressed: () {
                    // Add image picker functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepPurpleAccent),
                  onPressed: () {
                    // Add send message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBubble(String message, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.deepPurpleAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
