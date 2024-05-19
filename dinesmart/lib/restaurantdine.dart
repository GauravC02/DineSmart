import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String logo;
  final String location;
  final String coverImage;

  Restaurant({
    required this.name,
    required this.logo,
    required this.location,
    required this.coverImage,
  });
}

final List<Restaurant> allRestaurants = [
  Restaurant(
    name: 'KFC',
    logo: 'assets/kfc.png',
    location: 'Kathmandu',
    coverImage: 'assets/kfccover.png',
  ),
  Restaurant(
    name: 'Pizza Hut',
    logo: 'assets/pizzahut.png',
    location: 'Lalitpur',
    coverImage: 'assets/pizzahutcover.png',
  ),
  Restaurant(
    name: 'McDonalds',
    logo: 'assets/mcdonalds.png',
    location: 'Bhaktapur',
    coverImage: 'assets/mcdonaldscover.png',
  ),
  Restaurant(
    name: 'Burger King',
    logo: 'assets/burgerking.png',
    location: 'Dhulikhel',
    coverImage: 'assets/burgerkingcover.png',
  ),
  Restaurant(
    name: 'Starbucks',
    logo: 'assets/starbucks.png',
    location: 'Pokhara',
    coverImage: 'assets/starbuckscover.png',
  ),
  // Add more restaurant objects as needed
];

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantItem({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                restaurant.logo,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Location: ${restaurant.location}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Cover Image with Logo
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: double.infinity,
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(restaurant.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Image.asset(
                    restaurant.logo,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            restaurant.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(category: 'Snacks'),
                CategoryItem(category: 'Drinks'),
                CategoryItem(category: 'Dinner'),
                CategoryItem(category: 'Breakfast'),
                CategoryItem(category: 'Dessert'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
