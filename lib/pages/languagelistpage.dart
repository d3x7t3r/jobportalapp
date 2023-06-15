import 'package:flutter/material.dart';

class LanguageListPage extends StatelessWidget {
  final Function(String, BuildContext) updateLanguage;
  const LanguageListPage({Key? key, required this.updateLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              handleLanguageSelection('English', context);
            },
          ),
          ListTile(
            title: const Text('Spanish'),
            onTap: () {
              handleLanguageSelection('Spanish', context);
            },
          ),
          // Add more languages as needed
        ],
      ),
    );
  }

  void handleLanguageSelection(String language, BuildContext context) {
    // Call the callback function with the selected language
    // Replace 'updateLanguage' with the actual function to update the selected language
    updateLanguage(language, context);

    // Navigate back to the settings page
    Navigator.pop(context);
  }
}
