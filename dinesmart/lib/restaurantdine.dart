import 'package:flutter/material.dart';

class RestaurantDinePage extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(name: 'KFC', logo: 'assets/kfc.png', location: 'Kathmandu'),
    Restaurant(
        name: 'Pizza Hut',
        logo: 'assets/pizzahut.png',
        location: 'Durbar Marg'),
    Restaurant(
        name: 'McDonalds', logo: 'assets/mcdonalds.png', location: 'Nepal'),
    Restaurant(
        name: 'Burger King',
        logo: 'assets/burgerking.png',
        location: 'America'),
    Restaurant(
        name: 'Starbucks',
        logo: 'assets/starbucks.png',
        location: 'United States of America'),
    // Add more restaurant objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantProfilePage(
                            restaurant: restaurants[index]),
                      ),
                    );
                  },
                  child: RestaurantItem(restaurant: restaurants[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String logo;
  final String location;

  Restaurant({required this.name, required this.logo, required this.location});
}

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
      body: Center(
        child: Text(
          'Profile page for ${restaurant.name}',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
