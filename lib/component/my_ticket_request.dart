import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro/services/database/database_service.dart';
import 'package:pro/services/image_picker.dart/piker.dart'; // For image selection

class RequestTicketPage extends StatefulWidget {
  const RequestTicketPage({super.key});

  @override
  _RequestTicketPageState createState() => _RequestTicketPageState();
}

class _RequestTicketPageState extends State<RequestTicketPage> {
  final _formKey = GlobalKey<FormState>();
//instance of the database_service & image picker
//____________________________________________________________________________
  final _db = DatabaseService();
  final _img = Piker();

  // Controllers for text fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController urgencyController = TextEditingController();
  TextEditingController problemtypeController = TextEditingController();
  TextEditingController requistedByController = TextEditingController();

  // Dropdown values
  String? selectedUrgency;
  String? selectedProblemType;

  // Image picker
  XFile? selectedImage;
//get the instance of the image picker
  final Piker selectedImagePath = Piker();

  // List of urgency levels and problem types
  List<String> urgencyLevels = ['Low', 'Medium', 'High'];
  List<String> problemTypes = ['Electrical', 'Mechanical', 'Plumbing', 'Other'];
//save the data into the database
  void saveRequest() async {
    await _db.saveTicketInfoInFirebase(
      title: titleController.text,
      description: descriptionController.text,
      urgency: selectedUrgency!,
      problemType: selectedProblemType!,
      requestBy: requistedByController.text,
    );
  }

  // Submit form function
  void submitTicket() {
    if (_formKey.currentState!.validate()) {
      // Process the form data and submit the ticket
      saveRequest();

      // Clear form fields after submission
      titleController.clear();
      descriptionController.clear();

      setState(() {
        selectedUrgency = null;
        selectedProblemType = null;
        selectedImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Maintenance Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title field
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Description field
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Image picker
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _img.showImageSourceDialog,
                      child: const Text('Upload Image (Optional)'),
                    ),
                    const SizedBox(width: 10),
                    if (selectedImage != null)
                      const Text(
                        'Image Selected',
                        style: TextStyle(color: Colors.green),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // Urgency dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Urgency'),
                  value: selectedUrgency,
                  items: urgencyLevels.map((String urgency) {
                    return DropdownMenuItem<String>(
                      value: urgency,
                      child: Text(urgency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUrgency = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the urgency level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Problem type dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Problem Type'),
                  value: selectedProblemType,
                  items: problemTypes.map((String problemType) {
                    return DropdownMenuItem<String>(
                      value: problemType,
                      child: Text(problemType),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedProblemType = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the problem type';
                    }
                    return null;
                  },
                ),
                //requetsed by
                TextFormField(
                  controller: requistedByController,
                  decoration: const InputDecoration(labelText: 'By Whom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter witter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Submit button
                ElevatedButton(
                  onPressed: submitTicket,
                  child: const Text('Submit Ticket'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
