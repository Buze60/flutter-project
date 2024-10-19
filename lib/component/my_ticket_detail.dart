import 'package:flutter/material.dart';
import 'package:pro/Models/ticket_request.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import the QR Flutter package

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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${ticket.title}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                'Requested By: ${ticket.requestBy}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'Scan the QR Code:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Center(
                  child: QrImageView(
                data: ticket.ticketID, // Use the ticketID for the QR code
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
