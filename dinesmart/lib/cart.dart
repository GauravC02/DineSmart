import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'menu.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>>? items; // List of items in the cart
  final String? restaurantName; // Name of the restaurant

  CartPage({Key? key, this.items, this.restaurantName}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();

  void addToCart(BuildContext context, MenuCategory selectedCategory,
      Map<int, int> itemQuantities, String restaurantName) {
    List<Map<String, dynamic>> cartItems = [];

    itemQuantities.forEach((itemId, quantity) {
      if (quantity > 0) {
        // Add item to the cart list with additional information
        cartItems.add({
          'name': selectedCategory.items
              .firstWhere((item) => item.id == itemId)
              .name,
          'price': selectedCategory.items
              .firstWhere((item) => item.id == itemId)
              .price,
          'quantity': quantity,
          'restaurantName': restaurantName, // Pass restaurant name
        });
      }
    });

    if (cartItems.isNotEmpty) {
      // Navigate to CartPage and pass the cart items and restaurant name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(
            items: cartItems,
            restaurantName: restaurantName,
          ),
        ),
      );
    } else {
      // Show a snackbar or toast indicating that no items are selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select items to add to cart'),
        ),
      );
    }
  }
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 4; // Set the initial index to Cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              // Add functionality to clear the cart
              setState(() {
                widget.items!.clear();
              });
            },
          ),
        ],
      ),
      body: widget.items != null && widget.items!.isNotEmpty
          ? ListView.builder(
              itemCount: widget.items!.length,
              itemBuilder: (context, index) {
                final item = widget.items![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${item['price']}'),
                          Text('Quantity: ${item['quantity']}'),
                          Text('Restaurant: ${widget.restaurantName ?? ""}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.items!.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
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
