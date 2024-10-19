import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro/component/my_text_field.dart';
import 'package:pro/services/database/database_service.dart';
import 'package:pro/services/image_picker.dart/piker.dart'; // For image selection

class RequestTicketPage extends StatefulWidget {
  const RequestTicketPage({super.key});

  @override
  _RequestTicketPageState createState() => _RequestTicketPageState();
}

class _RequestTicketPageState extends State<RequestTicketPage> {
  final _formKey = GlobalKey<FormState>();
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

  // List of urgency levels and problem types
  List<String> urgencyLevels = ['Low', 'Medium', 'High'];
  List<String> problemTypes = ['Electrical', 'Mechanical', 'Plumbing', 'Other'];

  // Save the data into the database
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
      requistedByController.clear();

      setState(() {
        selectedUrgency = null;
        selectedProblemType = null;
        selectedImage = null;
      });

      Navigator.of(context).pop(); // Close the dialog after submission
    }
  }

  // Function to show the AlertDialog with the form
  void showRequestDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Request Maintenance Ticket'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Title field
                  MyTextField(
                    controller: titleController,
                    hintText: "Title",
                    obscuretext: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Description field
                  MyTextField(
                    controller: descriptionController,
                    hintText: "Description",
                    obscuretext: false,
                    maxLine: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Image picker

                  //====================================================
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
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 20),

                  // Problem type dropdown
                  DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: 'Problem Type'),
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
                  const SizedBox(height: 20),
                  // Requested by field
                  MyTextField(
                      controller: requistedByController,
                      hintText: "requested by",
                      obscuretext: false),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //cancel button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            )),
                      ),
                      // Submit button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        child: TextButton(
                          onPressed: submitTicket,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Maintenance Ticket'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showRequestDialog, // Show dialog when pressed
          child: const Text('Open Ticket Form'),
        ),
      ),
    );
  }
}
