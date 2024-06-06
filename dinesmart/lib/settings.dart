// settings.dart
import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) {
              // Define the icon based on the current mode
              Icon themeIcon = notifier.isDarkMode
                  ? Icon(Icons.nightlight_round) // Icon for dark mode
                  : Icon(Icons.wb_sunny); // Icon for light mode

              return ListTile(
                leading: themeIcon,
                title: Text('Theme'),
                trailing: Switch(
                  value: notifier.isDarkMode,
                  onChanged: (value) {
                    notifier.toggleTheme();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notification settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Navigate to about page
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 4,
        onItemTapped: (index) {
          // Handle tapping on other bottom navigation bar items
          // You might want to navigate accordingly here too
        },
      ),
    );
  }
}
