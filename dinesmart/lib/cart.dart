import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>>? items; // List of items in the cart

  CartPage({Key? key, this.items}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 4; // Set the initial index to Cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: widget.items != null && widget.items!.isNotEmpty
          ? ListView.builder(
              itemCount: widget.items!.length,
              itemBuilder: (context, index) {
                final item = widget.items![index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Price: \$${item['price']}'),
                  trailing: Text('Qty: ${item['quantity']}'),
                  // You can add more actions here like remove item from cart
                );
              },
            )
          : Center(
              child: Text('Your cart is empty!'),
            ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${calculateTotal(widget.items ?? [])}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement checkout functionality
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotal(List<Map<String, dynamic>> items) {
    double total = 0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}
