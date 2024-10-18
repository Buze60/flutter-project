import 'package:cloud_firestore/cloud_firestore.dart';

class TicketRequest {
  String ticketID;
  String title;
  String description;
  String? imageUrl; // Optional
  String urgency;
  String problemType;
  DateTime createdAt;
  String requestBy;

  TicketRequest({
    required this.ticketID,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.urgency,
    required this.problemType,
    DateTime? createdAt,
    required this.requestBy,
  }) : createdAt = createdAt ?? DateTime.now();

  // Method to convert a TicketRequest object to a Firestore document
  Map<String, dynamic> toMap() {
    return {
      'ticketID': ticketID,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'urgency': urgency,
      'problemType': problemType,
      'createdAt': createdAt,
      'requestBy': requestBy,
    };
  }

  // Method to create a TicketRequest object from a Firestore document
  factory TicketRequest.fromdocument(Map<String, dynamic> map) {
    return TicketRequest(
      ticketID: map['ticketID'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      urgency: map['urgency'],
      problemType: map['problemType'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      requestBy: map['requestBy'],
    );
  }
}
