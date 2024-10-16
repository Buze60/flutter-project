import 'package:flutter/material.dart';
import 'package:pro/pages/chat_detail_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        children: [
          chatItem(context, 'Mikiyas Bayle', 'Hello', 'October 8, 2024',
              'assets/provider_avatar.png'),
          chatItem(context, 'Fikade Tibebe', 'Okay', 'October 8, 2024',
              'assets/chanthini_avatar.png'),
          chatItem(context, 'Buzayew', 'ok', 'October 5, 2024',
              'assets/felix_avatar.png'),
          chatItem(context, 'Abebe ', 'ok', 'October 5, 2024',
              'assets/leo_avatar.png'),
          // Add more chat items here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Assuming Chat is the 4th tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Add navigation logic here
        },
      ),
    );
  }

  Widget chatItem(BuildContext context, String name, String message,
      String date, String avatar) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatar),
      ),
      title: Text(name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      subtitle:
          Text(message, style: TextStyle(fontSize: 16, color: Colors.grey)),
      trailing: Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(chatName: name),
          ),
        );
      },
    );
  }
}
