import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This Privacy Policy describes how we collect, use, and disclose information when you use our app.',
            ),
            SizedBox(height: 16),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may collect information that you provide to us, such as your name, email address, and phone number.',
            ),
            SizedBox(height: 16),
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may use your information to provide and improve our services, send you updates and notifications, and respond to your inquiries.',
            ),
            SizedBox(height: 16),
            Text(
              'Information Sharing and Disclosure',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may share your information with third parties for purposes such as analytics, marketing, and other legitimate business purposes.',
            ),
            SizedBox(height: 16),
            Text(
              'Data Retention',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We will retain your information for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.',
            ),
          ],
        ),
      ),
    );
  }
}
