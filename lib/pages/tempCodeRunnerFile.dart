import 'package:flutter/material.dart';

class PendingTasksPage extends StatelessWidget {
  const PendingTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsiveness
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List of Pending Tasks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Simulate the list of tasks (you can fetch from the backend)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10, // For example, 10 pending tasks
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: Icon(Icons.pending_actions),
                      title: Text('Task #${index + 1}'),
                      subtitle:
                          Text('Pending task details for task #${index + 1}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to task details when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailPage(taskNumber: index + 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskDetailPage extends StatelessWidget {
  final int taskNumber;

  const TaskDetailPage({super.key, required this.taskNumber});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Task #$taskNumber Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task #$taskNumber Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Add details about the task
            Text(
              'Detailed description of task #$taskNumber.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            if (screenWidth > 600) ...[
              // Additional content for larger screens
              Text(
                'More detailed information for wider screens',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
