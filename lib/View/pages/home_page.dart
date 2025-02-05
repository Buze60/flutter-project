import 'package:dbumms_app/View/pages/create_ticket_screen.dart';
import 'package:dbumms_app/View/pages/ticket_screen.dart';
import 'package:dbumms_app/View/widget/bar_chart.dart';
import 'package:dbumms_app/View/widget/custom_image_view.dart';
import 'package:dbumms_app/View/widget/custom_text.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const FirstPage(),
    const TicketScreen(),
    const CreateTicketScreen(),
    SettingsPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: 'Work Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                        text: 'Hello Kenneth,',
                        color: Colors.grey,
                        weight: FontWeight.bold,
                        size: 20),
                    Customtext(
                        text: 'Welcome Back!',
                        color: Colors.black54,
                        weight: FontWeight.bold,
                        size: 30)
                  ],
                ),
                //person image
                CustomImageView(
                  height: 50,
                  width: 50,
                  image: '',
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(height: 20),
            const Customtext(
              text: 'WORK ORDERS DUE THIS WEEK (14)',
              color: Colors.grey,
              weight: FontWeight.bold,
              size: 16,
            ),
            GraphWidget(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Customtext(
                    text: 'View All Work Activity',
                    color: Colors.orange,
                    weight: FontWeight.bold,
                    size: 16,
                  ),
                  SizedBox(height: 15),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.orange,
                    size: 18,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            //List of Tasks
            const Customtext(
              text: "RECENT ACTIVITY",
              color: Colors.grey,
              weight: FontWeight.w600,
              size: 14,
            ),
            const SizedBox(height: 20),
            // Expanded(
            //   child: WorkOrderList(workOrders: workOrders),
            // )
          ],
        ),
      ),
    );
  }
}


class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WorkOrdersScreen extends StatelessWidget {
  const WorkOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Word Order");
  }
}