import 'package:flutter/material.dart';
import 'package:pro/pages/bookings_page.dart';
import 'package:pro/pages/chat_page.dart';
import 'package:pro/pages/completed_tasks_page.dart';
import 'package:pro/pages/ongoing_tasks_page.dart';
import 'package:pro/pages/overall_efficiency_page.dart';
import 'package:pro/pages/pending_tasks_page.dart';
import 'package:pro/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? toggleTheme;

  const HomePage({super.key, this.toggleTheme, uid});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    switch (index) {
      case 0:
        // No navigation for Home as it's the same page
        break;
      case 1:
        // Navigate to Bookings Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingsPage()),
        );
        break;
      case 2:
        // Navigate to Chat Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
        break;
      case 3:
        // Navigate to Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfilePage(
                    uid: '',
                    toggleTheme: () {},
                  )),
        );
        break;
    }
  }

  // The ongoing image
  final String ongoingImage = 'assets/img/ongoing.jpeg';

  // Define search history and filtered search results
  List<String> searchHistory = [
    "Pending Tasks",
    "Overall Efficiency",
    "Ongoing Tasks",
    "Completed Tasks",
    "Ticket #123",
    "Service Request #456",
  ];
  List<String> filteredSearchHistory = [];
  TextEditingController searchController = TextEditingController();
  bool isSearchHistoryVisible =
      false; // Track the visibility of the search history

  // New Request Form Fields
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String maintenanceTitle = '';
  String description = '';
  String selectedCategory = 'Electrical'; // Default category
  String urgencyLevel = 'Normal'; // Default urgency
  DateTime? selectedDate;

  // Technician data for availability
  final List<Map<String, String>> _technicians = [
    {'name': 'Technician A', 'status': 'Available'},
    {'name': 'Technician B', 'status': 'Busy'},
    {'name': 'Technician C', 'status': 'Available'},
    {'name': 'Technician D', 'status': 'Busy'},
    {'name': 'Technician E', 'status': 'Available'},
  ];

  bool _showAllTechnicians =
      false; // Flag to control the visibility of all technicians

  @override
  void initState() {
    super.initState();
    // Initialize the filtered search history
    filteredSearchHistory = List.from(searchHistory);
  }

  // Update the filtered search history based on user input
  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredSearchHistory = List.from(searchHistory);
      isSearchHistoryVisible = false; // Hide search history if query is empty
    } else {
      filteredSearchHistory = searchHistory
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isSearchHistoryVisible = true; // Show search history if there are matches
    }
    setState(() {});
  }

  // Function to close the search history
  void _closeSearchHistory() {
    setState(() {
      isSearchHistoryVisible = false;
      searchController.clear(); // Clear the search input
    });
  }

  // Function to show the request form
  void _showRequestForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Maintenance Request'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(Icons.title, 'Maintenance Title',
                      (value) => maintenanceTitle = value),
                  _buildTextField(Icons.description, 'Description',
                      (value) => description = value),
                  _buildDropdownField('Category', selectedCategory, <String>[
                    'Electrical',
                    'Plumbing',
                    'HVAC',
                    'General Maintenance',
                    'Landscaping',
                    'Others'
                  ], (newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  }),
                  _buildDropdownField('Urgency Level', urgencyLevel,
                      <String>['Low', 'Normal', 'High', 'Urgent'], (newValue) {
                    setState(() {
                      urgencyLevel = newValue!;
                    });
                  }),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text(
                      'Select Date: ${selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" : "Not selected"}',
                      style: TextStyle(
                          color: selectedDate != null
                              ? Colors.black
                              : Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _showSuccessNotification(); // Show success notification
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to show success notification
  void _showSuccessNotification() {
    final ticketNumber = (1000 + DateTime.now().millisecondsSinceEpoch % 10000)
        .toString(); // Generate a random ticket number
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(
              'You have successfully requested maintenance on ticket number #$ticketNumber.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to build text fields with icons
  Widget _buildTextField(
      IconData icon, String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        validator: (value) => value!.isEmpty ? 'Enter a title' : null,
      ),
    );
  }

  // Function to build dropdown fields
  Widget _buildDropdownField(String label, String currentValue,
      List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Ongoing Image
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ongoingImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 20,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications, color: Colors.white),
                          onPressed: () {
                            _showNotificationDrawer(context);
                          },
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.dark_mode, color: Colors.white),
                          onPressed: widget.toggleTheme,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5, color: Colors.black12)
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search), // Search icon
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: _filterSearchResults,
                            decoration: InputDecoration(
                              hintText: 'Search services...',
                              border: InputBorder.none,
                            ),
                            onTap: () {
                              setState(() {
                                isSearchHistoryVisible = true;
                              });
                            },
                          ),
                        ),
                        // Close button to clear search history
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: _closeSearchHistory,
                        ),
                      ],
                    ),
                  ),
                  // Display Search History
                  if (isSearchHistoryVisible &&
                      filteredSearchHistory.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filteredSearchHistory.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(filteredSearchHistory[index]),
                                onTap: () {
                                  searchController.text =
                                      filteredSearchHistory[index];
                                  _filterSearchResults(
                                      filteredSearchHistory[index]);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Booking Confirmation Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Colors.purple.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.white),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Your booking is confirmed.',
                              style: TextStyle(color: Colors.white)),
                          Text('Filter Replacement',
                              style: TextStyle(color: Colors.white)),
                          Text('October 10, 2024 1:59 PM',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          // Handle card dismissal
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryButton(
                            'Pending Tasks', Icons.hourglass_empty),
                        _buildCategoryButton(
                            'Overall Efficiency', Icons.assessment),
                        _buildCategoryButton(
                            'Ongoing Tasks', Icons.play_circle),
                        _buildCategoryButton(
                            'Completed Tasks', Icons.check_circle),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Technician Availability Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Technician Availability',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ListTile(
                    title: Text(_technicians[0]['name']!),
                    subtitle: Text(_technicians[0]['status']!),
                    leading: Icon(
                      _technicians[0]['status'] == 'Available'
                          ? Icons.check_circle
                          : Icons.cancel,
                      color: _technicians[0]['status'] == 'Available'
                          ? Colors.green
                          : Colors.red,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        setState(() {
                          _showAllTechnicians = true; // Show all technicians
                        });
                      },
                    ),
                  ),
                  if (_showAllTechnicians) ...[
                    for (var tech in _technicians
                        .skip(1)) // Display remaining technicians
                      ListTile(
                        title: Text(tech['name']!),
                        subtitle: Text(tech['status']!),
                        leading: Icon(
                          tech['status'] == 'Available'
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: tech['status'] == 'Available'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                  ],
                ],
              ),
            ),

            // New Maintenance Request Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  backgroundColor: Colors.blue, // Background color
                ),
                onPressed: () {
                  _showRequestForm(context); // Show the request form
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text('New Maintenance Request',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/img/profile.jpeg'),
              radius: 12,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to show notification drawer
  void _showNotificationDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 300, // Adjust height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              // Example notifications
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('Task assigned: Ticket #152'),
                      subtitle: Text('Assigned to John Doe at 10:00 AM'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('Task completed: Ticket #141'),
                      subtitle: Text('Completed by Jane Smith at 1:30 PM'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blue),
                      title: Text('New request submitted: Ticket #200'),
                      subtitle: Text('Submitted by Space Dept. at 3:15 PM'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (label == 'Pending Tasks') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PendingTasksPage(),
                  ),
                );
              } else if (label == 'Overall Efficiency') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OverallEfficiencyPage(),
                  ),
                );
              } else if (label == 'Ongoing Tasks') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OngoingTasksPage(),
                  ),
                );
              } else if (label == 'Completed Tasks') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTasksPage(),
                  ),
                );
              } else if (label == 'Bookings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingsPage(),
                  ),
                );
              } else if (label == 'Chat') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              } else if (label == 'Profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      uid: '',
                      toggleTheme: () {},
                    ),
                  ),
                );
              }
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade100,
              child: Icon(icon, size: 30, color: Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
