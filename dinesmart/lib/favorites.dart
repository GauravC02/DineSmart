// favorites.dart
import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text(
          'Your favorite restaurants will be displayed here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1, // Index of the Favorites page
        onItemTapped: (index) {
          // Handle tapping of items, if necessary
        },
      ),
    );
  }
}
