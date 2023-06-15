import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logger/logger.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  final logger = Logger();

  Future<void> sendEmail() async {
    String username = 'mnenga17@gmail.com';
    String accessToken = 'your_access_token';
    String recipient = 'mnengaally6@gmail.com';

    var smtpServer = gmailSaslXoauth2(username, accessToken);

    var message = Message()
      ..from = Address(username)
      ..recipients.add(recipient)
      ..subject = 'Test Email'
      ..text = 'Hello, this is a test email';

    try {
      final sendReport = await send(message, smtpServer);
      logger.d('Message sent: $sendReport');
    } catch (e) {
      logger.d('Error occurred while sending email: $e');
    }
  }

  Future<void> launchFacebookURL() async {
    const facebookURL = 'https://www.facebook.com/';
    // ignore: deprecated_member_use
    if (await canLaunch(facebookURL)) {
      // ignore: deprecated_member_use
      await launch(facebookURL);
    } else {
      logger.d('Could not launch Facebook URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How can we assist you?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email Support'),
              onTap: sendEmail,
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Support'),
              onTap: () {
                // Implement phone support functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Live Chat'),
              onTap: () {
                // Implement live chat functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text('Facebook'),
              onTap: launchFacebookURL,
            ),
            ListTile(
              leading: const Icon(Icons.discord),
              title: const Text('Discord'),
              onTap: () {
                // Implement live chat functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQs'),
              onTap: () {
                // Implement live chat functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
