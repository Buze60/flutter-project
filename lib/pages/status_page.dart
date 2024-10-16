import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for ongoing tasks (this should be dynamic)
    final List<Map<String, String>> ongoingTasks = [
      {'title': 'Repair satellite link', 'status': 'In Progress'},
      {'title': 'Check ground station', 'status': 'Pending'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Requests Status'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: ongoingTasks.length,
        itemBuilder: (context, index) {
          final task = ongoingTasks[index];
          return Card(
            child: ListTile(
              title: Text(task['title']!),
              subtitle: Text('Status: ${task['status']}'),
            ),
          );
        },
      ),
    );
  }
}
