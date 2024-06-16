import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Order> orders = []; // List to store order history

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: orders.isEmpty
          ? Center(
              child: Text('No orders yet.'),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text(order.restaurantName),
                  subtitle: Text(
                      'Total: \ Nrs ${order.totalAmount.toStringAsFixed(2)}'),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 3, // Index of the History page
        onItemTapped: (index) {
          // Handle tapping of items, if necessary
        },
      ),
    );
  }

  void addOrder(String restaurantName, double totalAmount) {
    setState(() {
      orders.add(Order(restaurantName, totalAmount));
    });
  }
}

class Order {
  final String restaurantName;
  final double totalAmount;

  Order(this.restaurantName, this.totalAmount);
}
