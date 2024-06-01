import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart'; // Import the BottomNavigationBarWidget

class PaymentDetailsPage extends StatelessWidget {
  final double totalAmount;

  PaymentDetailsPage({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic
                _showPaymentSuccessDialog(context);
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 4, // Set the appropriate index for the selected tab
        onItemTapped: (index) {}, // Define the functionality for tapping items
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Thank you for your purchase!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
                Navigator.pop(context); // Pop PaymentDetailsPage
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
