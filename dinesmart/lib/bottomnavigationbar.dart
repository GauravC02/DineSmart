import 'package:flutter/material.dart';
import 'qrscanner.dart'; // Import the QR scanner page
import 'dashboard.dart'; // Import the DashboardPage
import 'favorites.dart'; // Import the FavoritesPage
import 'history.dart'; // Import the HistoryPage
import 'settings.dart'; // Import the SettingsPage

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: Colors.blue),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code, color: Colors.blue),
          label: 'QR Scanner',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: Colors.blue),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.blue),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesPage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScannerPage()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        } else if (index == 4) {
          Navigator.push(
            // Check for the matching parentheses here
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          ); // Ensure there is a semicolon here
        } else {
          onItemTapped(index);
        }
      },
    );
  }
}
