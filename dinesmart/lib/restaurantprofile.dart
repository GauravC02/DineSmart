import 'package:flutter/material.dart';

class RestaurantProfilePage extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(restaurant.coverPhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Location: ${restaurant.location}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Display menu items and prices
                for (var menuItem in restaurant.menu)
                  ListTile(
                    title: Text(menuItem.name),
                    trailing: Text('\$${menuItem.price.toStringAsFixed(2)}'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String coverPhoto;
  final String location;
  final List<MenuItem> menu;

  Restaurant({
    required this.name,
    required this.coverPhoto,
    required this.location,
    required this.menu,
  });
}

class MenuItem {
  final String name;
  final double price;

  MenuItem({required this.name, required this.price});
}
