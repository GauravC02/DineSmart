import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final double price;

  MenuItem({required this.name, required this.price});
}

class MenuItems {
  static List<MenuItem> getItemsForRestaurant(String restaurantName) {
    switch (restaurantName) {
      case 'KFC':
        return kfcMenu;
      case 'Pizza Hut':
        return pizzaHutMenu;
      case 'McDonalds':
        return mcdonaldsMenu;
      case 'Burger King':
        return burgerKingMenu;
      case 'Starbucks':
        return starbucksMenu;
      default:
        return [];
    }
  }

  static List<MenuItem> kfcMenu = [
    MenuItem(name: 'Chicken Wings', price: 5.99),
    MenuItem(name: 'Fried Chicken', price: 6.99),
    MenuItem(name: 'Potato Wedges', price: 3.99),
    // Add more items as needed
  ];

  static List<MenuItem> pizzaHutMenu = [
    MenuItem(name: 'Pepperoni Pizza', price: 8.99),
    MenuItem(name: 'Margherita Pizza', price: 7.99),
    MenuItem(name: 'Garlic Breadsticks', price: 4.99),
    // Add more items as needed
  ];

  static List<MenuItem> mcdonaldsMenu = [
    MenuItem(name: 'Big Mac', price: 4.99),
    MenuItem(name: 'French Fries', price: 2.99),
    MenuItem(name: 'McFlurry', price: 3.99),
    // Add more items as needed
  ];

  static List<MenuItem> burgerKingMenu = [
    MenuItem(name: 'Whopper', price: 5.99),
    MenuItem(name: 'Chicken Sandwich', price: 4.99),
    MenuItem(name: 'Onion Rings', price: 3.99),
    // Add more items as needed
  ];

  static List<MenuItem> starbucksMenu = [
    MenuItem(name: 'Caramel Frappuccino', price: 4.99),
    MenuItem(name: 'Latte', price: 3.99),
    MenuItem(name: 'Mocha', price: 4.49),
    // Add more items as needed
  ];
}

class RestaurantProfilePage extends StatelessWidget {
  final String restaurantName;

  RestaurantProfilePage({required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = MenuItems.getItemsForRestaurant(restaurantName);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildCategory('Snacks', menuItems),
                  _buildCategory('Drinks', menuItems),
                  _buildCategory('Dinner', menuItems),
                  _buildCategory('Breakfast', menuItems),
                  _buildCategory('Dessert', menuItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String categoryName, List<MenuItem> menuItems) {
    List<MenuItem> itemsInCategory = menuItems
        .where((item) =>
            item.name.toLowerCase().contains(categoryName.toLowerCase()))
        .toList();
    return itemsInCategory.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: itemsInCategory
                    .map((item) => _buildMenuItem(item))
                    .toList(),
              ),
              Divider(),
            ],
          )
        : SizedBox.shrink();
  }

  Widget _buildMenuItem(MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
