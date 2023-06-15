import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:jobportalapp/pages/signuppage.dart';
import 'package:logger/logger.dart';
import 'package:jobportalapp/pages/accountpage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

enum UserType {
  employee,
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> login() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;

      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the current user
      firebase_auth.User? user = auth.currentUser;

      if (user != null) {
        // Retrieve the user type from your database
        UserType? userType = await getUserTypeFromDatabase(user.uid);

        if (userType != null) {
          // Check the user type
          // If employee, navigate to AccountPage
          if (userType == UserType.employee) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );

            // Show a successful message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful')),
            );
          }
        } else {
          // Handle case when user type is not retrieved
          throw Exception('User type not found');
        }
      } else {
        // Handle case when user is null
        throw Exception('User not found');
      }
    } catch (e, stackTrace) {
      logger.e('Login Error: $e', e, stackTrace);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Login Error: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<UserType?> getUserTypeFromDatabase(String userId) async {
    try {
      // Implement the code to retrieve the user type from your database

      // Dummy implementation for demonstration purposes
      // Assume you have a Firestore collection named 'users' with a document for each user
      // Each document has a field named 'userType' which stores the user type (employee)

      // Replace the following code with your actual implementation
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      var userTypeString = userDoc.data()!['userType'] as String?;

      if (userTypeString != null && userTypeString == 'employee') {
        return UserType.employee;
      } else {
        return null; // User type not found
      }
    } catch (e) {
      logger.e('Error retrieving user type: $e');
      return null; // Error occurred while retrieving user type
    }
  }

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 211, 222, 228),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Barlow',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: login,
              child: const Text('Log in'),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
