import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Widget _buildCircularLogo(String imagePath, double size) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: _buildCircularLogo(
                  'assets/esewa.png', 48), // Adjust size as needed
              title: Text('eSewa'),
              onTap: () {
                // Handle eSewa payment
              },
            ),
            SizedBox(height: 16), // Add spacing between list tiles
            ListTile(
              leading: _buildCircularLogo(
                  'assets/khalti.png', 48), // Adjust size as needed
              title: Text('Khalti'),
              onTap: () {
                // Handle Khalti payment
              },
            ),
            SizedBox(height: 16), // Add spacing between list tiles
            ListTile(
              leading: _buildCircularLogo(
                  'assets/imepay.png', 48), // Adjust size as needed
              title: Text('IME Pay'),
              onTap: () {
                // Handle IME Pay payment
              },
            ),
            SizedBox(height: 16),
            ListTile(
              leading: _buildCircularLogo(
                  'assets/fonepay.png', 48), // Adjust size as needed
              title: Text('Fonepay'),
              onTap: () {
                // Handle Fonepay payment
              },
            ),
          ],
        ),
      ),
    );
  }
}
