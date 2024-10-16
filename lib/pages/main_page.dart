import 'package:flutter/material.dart';
import 'package:pro/pages/bookings_page.dart';

import 'chat_page.dart'; // Import your chat page
import 'home_page.dart'; // Import your home page
import 'profile_page.dart'; // Import your profile page

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List of pages to display in the main content area
  final List<Widget> _pages = [
    // ignore: prefer_const_constructors
    HomePage(
      toggleTheme: () {},
      uid: '',
    ),
    BookingsPage(),
    ChatPage(),
    ProfilePage(
      uid: '',
      toggleTheme: () {},
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the currently selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle tap events
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}
