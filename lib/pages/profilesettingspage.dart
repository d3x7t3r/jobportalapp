import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobportalapp/pages/editprofilepage.dart';
import 'package:jobportalapp/pages/loginpage.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            leading: const Icon(Icons.edit),
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          // Perform logout logic
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
