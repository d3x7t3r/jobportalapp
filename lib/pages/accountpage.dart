import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobportalapp/pages/dashboardpage.dart';
import 'package:jobportalapp/pages/settings_page.dart';
//import 'package:jobportalapp/pages/reportpage.dart';
//import 'package:shimmer/main.dart';
import 'package:jobportalapp/pages/homepage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  late String userName;
  late String userEmail = '';

  @override
  void initState() {
    super.initState();
    // Get the current user's display name and email
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      userName = user.displayName ?? '';
      userEmail = user.email ?? '';
    } else {
      userName = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.description),
        //     onPressed: () {
        //       List<JobApplication> fetchedApplications = [];
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) =>
        //               ReportPage(applications: fetchedApplications),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profileimage.png'),
              ),
              const SizedBox(height: 16),
              Text(
                'Username',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userName,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Email',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userEmail,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              // Text(
              //   'Phone',
              //   style: GoogleFonts.montserrat(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const Text(
              //   '+255687689731',
              //   style: TextStyle(
              //     fontSize: 16,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(
                  acceptedJobs: 0,
                  appliedJobs: 0,
                  pendingJobs: 0,
                  rejectedJobs: 0,
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
