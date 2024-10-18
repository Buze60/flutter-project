import 'package:flutter/material.dart';
import 'package:pro/Models/ticket_request.dart';

class TicketDetailPage extends StatelessWidget {
  final TicketRequest ticket;

  const TicketDetailPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${ticket.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${ticket.description}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Urgency: ${ticket.urgency}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Problem Type: ${ticket.problemType}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Requested By: ${ticket.requestBy}', // Assuming you have this field
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
