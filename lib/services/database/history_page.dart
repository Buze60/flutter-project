import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Static list of previous requests (this should come from the database in a real app)
    final List<Map<String, String>> requestHistory = [
      {
        'title': 'Fix satellite dish',
        'date': '2024-08-12',
        'status': 'Completed'
      },
      {'title': 'Repair antenna', 'date': '2024-08-15', 'status': 'Pending'},
      {'title': 'Network issue', 'date': '2024-09-10', 'status': 'In Progress'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request History'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: requestHistory.length,
        itemBuilder: (context, index) {
          final request = requestHistory[index];
          return Card(
            child: ListTile(
              title: Text(request['title']!),
              subtitle: Text(
                  'Date: ${request['date']} - Status: ${request['status']}'),
            ),
          );
        },
      ),
    );
  }
}
