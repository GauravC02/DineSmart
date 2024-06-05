import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPaymentRow(
            context,
            'https://esewa.com.np/',
            'eSewa',
            'assets/esewa.png',
          ),
          _buildPaymentRow(
            context,
            'https://khalti.com/',
            'Khalti',
            'assets/khalti.png',
          ),
          _buildPaymentRow(
            context,
            'https://www.imepay.com.np/',
            'IME Pay',
            'assets/imepay.png',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(
      BuildContext context, String url, String title, String imagePath) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30, // Adjust as needed
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold), // Custom text style
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
