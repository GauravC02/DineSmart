import 'package:flutter/material.dart';
import 'login.dart'; // Import your login page file
import 'dashboardcontent.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(onLogoutPressed: () {
        // Call the logout function
        _logout(context);
      }),
      body: DashboardContent(),
    );
  }

  void _logout(BuildContext context) {
    // Use Navigator to pop the DashboardPage and return to the LoginPage
    Navigator.pop(context);
  }
}

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogoutPressed;

  const DashboardAppBar({required this.onLogoutPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Dashboard'),
      automaticallyImplyLeading: false, // This removes the back arrow
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: onLogoutPressed,
        ),
      ],
    );
  }
}
