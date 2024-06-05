import 'package:flutter/material.dart';
import 'restaurants.dart';
import 'menu.dart';
import 'bottomnavigationbar.dart'; // Import the BottomNavigationBarWidget
import 'cart.dart'; // Import the CartPage

class RestaurantProfilePage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  late MenuCategory _selectedCategory;
  late Map<int, int> _itemQuantities; // Map to store quantity for each item

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.restaurant.menu.first;
    _itemQuantities = Map.fromIterable(
      _selectedCategory.items,
      key: (item) => item.id,
      value: (item) => 0,
    );
  }

  void _onQuantityChanged(int itemId, int newQuantity) {
    setState(() {
      if (newQuantity >= 0) {
        _itemQuantities[itemId] = newQuantity;
      } else {
        // Prevent negative quantities
        _itemQuantities[itemId] = 0;
      }
    });
  }

  MenuItem _findMenuItem(int itemId) {
    for (var category in widget.restaurant.menu) {
      final item = category.items.firstWhere(
        (item) => item.id == itemId,
        orElse: () =>
            MenuItem(id: -1, name: '', price: 0.0), // Return a default MenuItem
      );
      if (item.id != -1) {
        return item;
      }
    }
    throw Exception(
        'Item with ID $itemId not found.'); // Throw an exception if no item is found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {
                // Check if any items are selected
                bool itemsSelected =
                    _itemQuantities.entries.any((entry) => entry.value > 0);

                // If no items are selected, show a Snackbar
                if (!itemsSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('The cart is empty.'),
                    ),
                  );
                } else {
                  // If items are selected, navigate to the cart page
                  CartPage(
                    items: _itemQuantities.entries
                        .where((entry) => entry.value > 0)
                        .map((entry) => {
                              'id': entry.key,
                              'quantity': entry.value,
                              'name': _findMenuItem(entry.key).name,
                              'price': _findMenuItem(entry.key).price,
                            })
                        .toList(),
                    restaurantName: widget.restaurant.name,
                  ).addToCart(context);
                }
              },
              icon: Icon(Icons.shopping_cart), // Use the shopping cart icon
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.restaurant.coverImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            child: Image.asset(
                              widget.restaurant.logo,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (MenuCategory category in widget.restaurant.menu)
                          CategoryButton(
                            category: category,
                            isSelected: category == _selectedCategory,
                            onPressed: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: _selectedCategory.items.length,
          itemBuilder: (context, index) {
            final item = _selectedCategory.items[index];
            return MenuItemWidget(
              item: item,
              quantity: _itemQuantities[item.id] ?? 0,
              onQuantityChanged: (newQuantity) {
                _onQuantityChanged(item.id, newQuantity);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 0, // Set the appropriate index for the selected tab
        onItemTapped: (index) {}, // Define the functionality for tapping items
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final MenuCategory category;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton({
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          category.name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  MenuItemWidget({
    required this.item,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 31), // Add SizedBox with width 31 pixels
                Row(
                  children: [
                    IconButton(
                      iconSize: 20,
                      onPressed: () {
                        onQuantityChanged(quantity - 1); // Decrease quantity
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      iconSize: 20,
                      onPressed: () {
                        onQuantityChanged(quantity + 1); // Increase quantity
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
