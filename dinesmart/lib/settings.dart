import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow button
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Theme'),
            trailing: Icon(Icons.color_lens),
            onTap: () {
              // Navigate to theme settings page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notifications'),
            trailing: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Account'),
            trailing: Icon(Icons.account_circle),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.info),
            onTap: () {
              // Navigate to about page
            },
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 4, // Selects the Settings tab
        onItemTapped: (index) {
          // Handle tapping on other bottom navigation bar items
          // You might want to navigate accordingly here too
        },
      ),
    );
  }
}
