import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart'; // Import the BottomNavigationBarWidget

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 4, // Assuming Settings is the fifth item
        onItemTapped: (index) {}, // You might want to define this function
      ),
    );
  }
}
