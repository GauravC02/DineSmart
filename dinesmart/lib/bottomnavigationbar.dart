import 'package:flutter/material.dart';
import 'qrscanner.dart';
import 'dashboard.dart';
import 'favorites.dart';
import 'history.dart';
import 'settings.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  BottomNavigationBarItem getItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  Map<int, Widget> pagelist = {
    0: DashboardPage(),
    1: FavoritesPage(),
    2: QRScannerPage(),
    3: HistoryPage(),
    4: SettingsPage(),
  };

  @override
  Widget build(BuildContext context) {
    var bottomItemList = <BottomNavigationBarItem>[
      getItem(Icons.home, 'Home'),
      getItem(Icons.favorite, 'Favorites'),
      getItem(Icons.qr_code, 'QR Scan'),
      getItem(Icons.history, 'History'),
      getItem(Icons.settings, 'Settings')
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Add this line
        items: bottomItemList,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => pagelist[index] ?? DashboardPage(),
            ),
          );
        },
      ),
    );
  }
}
