import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobportalapp/pages/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:jobportalapp/pages/aboutpage.dart';
import 'package:jobportalapp/pages/accountpage.dart';
import 'package:jobportalapp/pages/complaintspage.dart';
import 'package:jobportalapp/pages/feedbackpage.dart';
import 'package:jobportalapp/pages/helppage.dart';
//import 'package:jobportalapp/pages/jobpostingformpage.dart';
//import 'package:jobportalapp/pages/joblistingspage.dart';
import 'package:jobportalapp/pages/privacypolicypage.dart';
import 'package:jobportalapp/pages/settings_page.dart';
import 'package:jobportalapp/pages/splash_page.dart';

import 'package:google_fonts/google_fonts.dart';

import 'app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<ApplicationState>(
      create: (context) => ApplicationState(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          highlightColor: Colors.blue,
        ),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        //'/postJob': (context) => const JobPostingFormPage(),
        //'/jobListings': (context) => const JobListingsPage(),
        '/accountpage': (context) => const AccountPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/aboutpage': (context) => const AboutPage(),
        '/privacypolicy': (context) => const PrivacyPolicyPage(),
        '/complaints': (context) => const ComplaintsPage(),
        '/feedback': (context) => const FeedbackPage(),
        '/help': (context) => HelpPage(),
        '/login': (context) => const LoginScreen(),
      },
      home: const SplashPage(),
    );
  }
}
