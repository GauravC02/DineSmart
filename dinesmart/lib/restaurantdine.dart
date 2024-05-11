import 'package:flutter/material.dart';

class RestaurantDinePage extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(name: 'Restaurant 1', logo: 'assets/restaurant1_logo.png'),
    Restaurant(name: 'Restaurant 2', logo: 'assets/restaurant2_logo.png'),
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
                return RestaurantItem(restaurant: restaurants[index]);
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

  Restaurant({required this.name, required this.logo});
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
              color: Colors.grey[300],
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
                'Location: Kathmandu',
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
