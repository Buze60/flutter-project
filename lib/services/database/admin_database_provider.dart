import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro/Models/ticket_model.dart';

class AdminDatabaseProvider {
  // the database instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save a new maintenance ticket
  Future<void> saveTicket(TicketModel ticket) async {
    await _db.collection('tickets').doc(ticket.id).set(ticket.toMap());
  }

  // // Retrieve all maintenance tickets
  // Future<List<TicketModel>> getTickets() async {
  //   QuerySnapshot snapshot = await _db.collection('tickets').get();
  //   return snapshot.docs.map((doc) {
  //     return TicketModel.fromMap(doc.data() as Map<String, dynamic>)
  //       ..id = doc.id;
  //   }).toList();
  // }

  // Update a maintenance ticket
  Future<void> updateTicket(TicketModel ticket) async {
    await _db.collection('tickets').doc(ticket.id).update(ticket.toMap());
  }

  // Delete a maintenance ticket
  Future<void> deleteTicket(String id) async {
    await _db.collection('tickets').doc(id).delete();
  }
}
