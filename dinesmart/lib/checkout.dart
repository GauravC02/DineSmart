import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'maps.dart';
import 'payment.dart'; // Import the PaymentPage widget

class CheckoutPage extends StatefulWidget {
  final double totalAmount;

  CheckoutPage({required this.totalAmount});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _navigateToMap();
            },
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Delivery Address'),
              subtitle: Text('Kathmandu, Nepal'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Options'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 0,
        onItemTapped: (index) {},
      ),
    );
  }

  void _navigateToMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(),
      ),
    );
  }
}
