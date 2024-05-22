import 'package:flutter/material.dart';
import 'qrscanner.dart'; // Import the QR scanner page
import 'dashboard.dart'; // Import the DashboardPage
import 'cart.dart'; // Import the CartPage
import 'favorites.dart'; // Import the FavoritesPage
import 'history.dart'; // Import the HistoryPage

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
          icon: Icon(Icons.shopping_cart, color: Colors.blue),
          label: 'Cart',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        if (index == 0) {
          // If the Home button is tapped, navigate to the DashboardPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        } else if (index == 1) {
          // If the Favorites button is tapped, navigate to the FavoritesPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesPage()),
          );
        } else if (index == 2) {
          // If the QR Code item is tapped, navigate to the QR scanner page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScannerPage()),
          );
        } else if (index == 3) {
          // If the History button is tapped, navigate to the HistoryPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        } else if (index == 4) {
          // If the Cart button is tapped, navigate to the CartPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        } else {
          // Call the onItemTapped function for other items
          onItemTapped(index);
        }
      },
    );
  }
}
