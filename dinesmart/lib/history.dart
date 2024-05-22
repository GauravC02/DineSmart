// history.dart
import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: Text(
          'Your browsing history will be displayed here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 3, // Index of the History page
        onItemTapped: (index) {
          // Handle tapping of items, if necessary
        },
      ),
    );
  }
}
