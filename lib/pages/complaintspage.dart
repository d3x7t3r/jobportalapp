import 'package:flutter/material.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({Key? key}) : super(key: key);

  @override
  ComplaintsPageState createState() => ComplaintsPageState();
}

class ComplaintsPageState extends State<ComplaintsPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitComplaint() {
    // String description = _descriptionController.text;

    // Process the complaint submission, e.g., send to server, store in database, etc.

    // Clear the input fields after submission
    _subjectController.clear();
    _descriptionController.clear();

    // Show a success message or navigate to a confirmation page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Complaint submitted successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Submit a Complaint',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitComplaint,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
