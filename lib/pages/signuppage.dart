import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:jobportalapp/pages/loginpage.dart';
import 'package:logger/logger.dart';

enum UserType {
  employee,
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  UserType _userType = UserType.employee;

  Future<void> signUp() async {
    try {
      final String firstName = _firstNameController.text.trim();
      final String lastName = _lastNameController.text.trim();
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final String confirmPassword = _confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Passwords do not match.'),
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
        return;
      }

      firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;

      firebase_auth.UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebase_auth.User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName('$firstName $lastName');

        // Create a user document in Firestore with the userType field set to 'employee'
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'userType': 'employee',
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('User is not logged in'),
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
        return;
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      logger.d('SignUp Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('SignUp Error: $e'),
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

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 222, 228),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Barlow',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
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
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Radio<UserType>(
                  value: UserType.employee,
                  groupValue: _userType,
                  onChanged: (UserType? value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                ),
                const Text('Employee'),
              ],
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
