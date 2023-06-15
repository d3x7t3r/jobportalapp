import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage> {
  TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feedback Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: 'General',
              items: const [
                DropdownMenuItem<String>(
                  value: 'General',
                  child: Text('General'),
                ),
                DropdownMenuItem<String>(
                  value: 'Bug Report',
                  child: Text('Bug Report'),
                ),
                DropdownMenuItem<String>(
                  value: 'Feature Request',
                  child: Text('Feature Request'),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Feedback',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your feedback...',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement feedback submission functionality
                feedbackController.text;

                // Process the feedback and take appropriate actions

                // Clear the input fields
                feedbackController.clear();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Feedback Submitted'),
                      content: const Text('Thank you for your feedback!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
