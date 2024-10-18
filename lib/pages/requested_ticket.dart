import 'package:flutter/material.dart';
import 'package:pro/Models/ticket_request.dart';
import 'package:pro/services/database/database_service.dart';

class RequestedTicket extends StatefulWidget {
  const RequestedTicket({super.key});

  @override
  State<RequestedTicket> createState() => _RequestedTicketState();
}

class _RequestedTicketState extends State<RequestedTicket> {
  // create the database instance
  final DatabaseService _db = DatabaseService();

  // Method to fetch ticket data
  //_________________________________________________________________________
  void fetchTicketsData() async {
    List<TicketRequest> fetchedTickets = await _db.getTicketsFromFirebase();
    setState(() {
      ticketRequests = fetchedTickets;
    });
  }

  // store the fetched tickets
  List<TicketRequest> ticketRequests = [];

  // fetch data when the app is initialized
  @override
  void initState() {
    super.initState();
    fetchTicketsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Center(child: Text('T I C K E T S ')),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ticketRequests.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ticketRequests.length,
              itemBuilder: (context, index) {
                final ticket = ticketRequests[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display the ticket title
                            Text(
                              'Title: ${ticket.title}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            // Display the ticket description
                            Text(
                              'Description: ${ticket.description}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            // Display the urgency
                            Text(
                              'Urgency: ${ticket.urgency}',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            // Display the problem type
                            Text(
                              'Problem Type: ${ticket.problemType}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text('assigned to:${ticket.requestBy}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
