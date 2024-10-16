class TicketModel {
  final String id; // Unique identifier for the ticket
  final String description; // Description of the issue
  final String status; // Current status (e.g., 'Open', 'In Progress', 'Closed')
  final String assignedTo; // Technician assigned to the ticket
  final String priority; // Priority level (e.g., 'Low', 'Medium', 'High')
  final DateTime createdAt; // Timestamp when the ticket was created
  final DateTime? updatedAt; // Timestamp for the last update (optional)

  TicketModel({
    required this.id,
    required this.description,
    required this.status,
    required this.assignedTo,
    required this.priority,
    required this.createdAt,
    this.updatedAt,
  });

  // Factory method to create a MaintenanceTicket from a map (e.g., from a database)
  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'],
      description: map['description'],
      status: map['status'],
      assignedTo: map['assignedTo'],
      priority: map['priority'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  // Method to convert a MaintenanceTicket to a map (e.g., for saving to a database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'status': status,
      'assignedTo': assignedTo,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
