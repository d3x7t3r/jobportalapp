import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String location = '';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text fields with the current user data
    usernameController.text = username;
    emailController.text = email;
    phoneNumberController.text = phoneNumber;
    locationController.text = location;
  }

  @override
  void dispose() {
    // Clean up the text field controllers
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void saveChanges() {
    // Get the updated user data from the text fields
    String updatedUsername = usernameController.text;
    String updatedEmail = emailController.text;
    String updatedPhoneNumber = phoneNumberController.text;
    String updatedLocation = locationController.text;

    // Save the changes to the user profile (perform necessary operations)

    // Update the state variables with the updated user data
    setState(() {
      username = updatedUsername;
      email = updatedEmail;
      phoneNumber = updatedPhoneNumber;
      location = updatedLocation;
    });

    // Show a success message or perform any other desired action
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
