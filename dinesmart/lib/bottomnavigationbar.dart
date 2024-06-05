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

  BottomNavigationBarItem getItem(Icon i, String s) {
    return BottomNavigationBarItem(icon: i, label: s);
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
      getItem(const Icon(Icons.home, color: Colors.blue), 'Home'),
      getItem(const Icon(Icons.favorite, color: Colors.blue), 'Favorites'),
      getItem(
          const Icon(
            Icons.qr_code,
            color: Colors.blue,
          ),
          'QR Scanner'),
      getItem(
          const Icon(
            Icons.history,
            color: Colors.blue,
          ),
          'History'),
      getItem(
          const Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          'Settings')
    ];

    return BottomNavigationBar(
      items: bottomItemList,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => pagelist[index] ?? DashboardPage()));
      },
    );
  }
}
