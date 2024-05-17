/*
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container for restaurant logo and name
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(restaurant.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Stack for cover photo and menu
          Stack(
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
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(restaurant.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height:
                            130), // Adjust this height to make space for the logo
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
                        trailing:
                            Text('\$${menuItem.price.toStringAsFixed(2)}'),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Categories section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Add categories like veg snacks, non-veg snacks, drinks here
                // Example:
                ListTile(
                  title: Text('Veg Snacks'),
                  onTap: () {
                    // Handle tap for veg snacks
                  },
                ),
                ListTile(
                  title: Text('Non-Veg Snacks'),
                  onTap: () {
                    // Handle tap for non-veg snacks
                  },
                ),
                ListTile(
                  title: Text('Drinks'),
                  onTap: () {
                    // Handle tap for drinks
                  },
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
  final String logo;
  final String location;
  final List<MenuItem> menu;

  Restaurant({
    required this.name,
    required this.coverPhoto,
    required this.logo,
    required this.location,
    required this.menu,
  });
}

class MenuItem {
  final String name;
  final double price;

  MenuItem({required this.name, required this.price});
}

*/