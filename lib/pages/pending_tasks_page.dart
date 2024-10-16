import 'dart:math';

import 'package:flutter/material.dart';

class PendingTasksPage extends StatelessWidget {
  final List<Map<String, String?>> tasks = [
    {
      "ticketNumber": "001",
      "status": "Pending",
      "dateTime": "2024-10-08 10:00 AM",
      "address": "Science Building",
      "technician": null,
      "provider": "Mikias Bayle", // New Provider Field
    },
    {
      "ticketNumber": "002",
      "status": "Cancelled",
      "dateTime": "2024-10-07 09:30 AM",
      "address": "Laboratory Hall",
      "technician": null,
      "provider": "Fikade Tibebe", // New Provider Field
    },
    {
      "ticketNumber": "003",
      "status": "Completed",
      "dateTime": "2024-10-09 02:00 PM",
      "address": "Library Wing",
      "technician": null,
      "provider": "Bizuayew", // New Provider Field
    },
  ];

  PendingTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of technicians
    final List<String> technicianNames = [
      "Mikias Bayle",
      "Fikade Tibebe",
      "Bizuayew"
    ];

    // Assign random technician names
    for (var task in tasks) {
      task["technician"] =
          technicianNames[Random().nextInt(technicianNames.length)];
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back to the previous page
          },
        ),
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              final ticketNumber =
                  task["ticketNumber"] ?? 'Unknown Ticket Number';
              final status = task["status"] ?? 'Unknown Status';
              final dateTime = task["dateTime"] ?? 'Unknown Date/Time';
              final address = task["address"] ?? 'Unknown Address';
              final technician = task["technician"] ?? 'Unknown Technician';
              final provider = task["provider"] ?? 'Unknown Provider';

              final statusColor = status == 'Pending'
                  ? Colors.orange
                  : status == 'Cancelled'
                      ? Colors.red
                      : Colors.green;

              return InkWell(
                onTap: () {
                  // Navigate to the detailed page when a task is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(
                        ticketNumber: ticketNumber,
                        status: status,
                        dateTime: dateTime,
                        address: address,
                        technician: technician,
                        provider: provider,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey.shade200],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.build, size: 30, color: statusColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Ticket #$ticketNumber - $status',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: statusColor,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                        Divider(height: 20, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date & Time:',
                                    style: TextStyle(color: Colors.grey)),
                                Text(dateTime,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Provider:',
                                    style: TextStyle(color: Colors.grey)),
                                Text(provider,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('Address: $address',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        Text('Technician: $technician',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Detail page for each task
class TaskDetailPage extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String dateTime;
  final String address;
  final String technician;
  final String provider;

  const TaskDetailPage({
    super.key,
    required this.ticketNumber,
    required this.status,
    required this.dateTime,
    required this.address,
    required this.technician,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Pending'
        ? Colors.orange
        : status == 'Cancelled'
            ? Colors.red
            : Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket #$ticketNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.build, size: 30, color: statusColor),
                SizedBox(width: 10),
                Text(
                  'Status: $status',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: statusColor),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Date & Time:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(dateTime,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Address:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(address,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Technician:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(technician,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Provider:',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(provider,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
