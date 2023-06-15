import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobportalapp/pages/loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
          seconds:
              3), // Set the duration for how long the splash page should be displayed (2 seconds in this example)
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue, // Set the background color of the splash page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Job Portal App', // Customize the text or add a logo/image here
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 248, 245, 245), // Set the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
