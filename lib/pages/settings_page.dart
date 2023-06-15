import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobportalapp/pages/aboutpage.dart';
import 'package:jobportalapp/pages/accountpage.dart';
import 'package:jobportalapp/pages/complaintspage.dart';
import 'package:jobportalapp/pages/dashboardpage.dart';
import 'package:jobportalapp/pages/feedbackpage.dart';
import 'package:jobportalapp/pages/helppage.dart';
import 'package:jobportalapp/pages/homepage.dart';
import 'package:jobportalapp/pages/languagelistpage.dart';
import 'package:jobportalapp/pages/privacypolicypage.dart';
import 'package:jobportalapp/pages/profilesettingspage.dart';
//import 'package:shimmer/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, int? parameter}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';
  bool isDarkMode = false;

  String? userName;

  @override
  void initState() {
    super.initState();

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      userName = user.displayName;
    }
  }

  SystemUiOverlayStyle lightModeOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  SystemUiOverlayStyle darkModeOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  void updateLanguage(String language, BuildContext context) {
    setState(() {
      selectedLanguage = language;
    });
  }

  void showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: const Text('English'),
                  onTap: () {
                    updateLanguage('English', context);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Spanish'),
                  onTap: () {
                    updateLanguage('Spanish', context);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Spanish'),
                  onTap: () {
                    updateLanguage('Spanish', context);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('German'),
                  onTap: () {
                    updateLanguage('Germany', context);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Italian'),
                  onTap: () {
                    updateLanguage('Italian', context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void logout() {
    // Implement your logout logic here
    // For example, clear user session, navigate to login screen, etc.
    // ...
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        systemOverlayStyle:
            isDarkMode ? darkModeOverlayStyle : lightModeOverlayStyle,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Profile Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileSettingsPage(),
                ),
              );
            },
            leading: const Icon(Icons.person),
          ),
          SwitchListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(),
            ),
            value: isDarkMode,
            onChanged: (value) {
              // Handle onChanged event
            },
            tileColor: isDarkMode ? Colors.grey[800] : Colors.white,
            activeColor: isDarkMode ? Colors.blue : null,
            secondary: const Icon(Icons.notifications),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            tileColor: isDarkMode ? Colors.grey[800] : Colors.white,
            leading: Icon(
              Icons.lightbulb,
              color: isDarkMode ? Colors.yellow : null,
            ),
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageListPage(
                    updateLanguage: updateLanguage,
                  ),
                ),
              );
            },
            leading: const Icon(
              Icons.language,
            ),
          ),
          ListTile(
            title: const Text('Privacy and Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
            leading: const Icon(Icons.privacy_tip),
          ),
          ListTile(
            title: const Text('Complaints'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ComplaintsPage(),
                ),
              );
            },
            leading: const Icon(Icons.message),
          ),
          ListTile(
            title: const Text('Feedback'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedbackPage(),
                ),
              );
            },
            leading: const Icon(Icons.send),
          ),
          ListTile(
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpPage(),
                ),
              );
            },
            leading: const Icon(Icons.help),
          ),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            leading: const Icon(Icons.info),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
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
                  appliedJobs: 1,
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), // Add the dashboard icon here
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
