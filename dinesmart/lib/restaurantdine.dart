import 'package:flutter/material.dart';

class RestaurantDinePage extends StatefulWidget {
  @override
  _RestaurantDinePageState createState() => _RestaurantDinePageState();
}

class _RestaurantDinePageState extends State<RestaurantDinePage> {
  final List<Restaurant> _allRestaurants = [
    Restaurant(name: 'KFC', logo: 'assets/kfc.png', location: 'Kathmandu'),
    Restaurant(
        name: 'Pizza Hut', logo: 'assets/pizzahut.png', location: 'Lalitpur'),
    Restaurant(
        name: 'McDonalds', logo: 'assets/mcdonalds.png', location: 'Bhaktapur'),
    Restaurant(
        name: 'Burger King',
        logo: 'assets/burgerking.png',
        location: 'Dhulikhel'),
    Restaurant(
        name: 'Starbucks', logo: 'assets/starbucks.png', location: 'Pokhara'),
    // Add more restaurant objects as needed
  ];

  late List<Restaurant> _filteredRestaurants;

  @override
  void initState() {
    super.initState();
    _filteredRestaurants = _allRestaurants;
  }

  void _filterRestaurants(String query) {
    setState(() {
      _filteredRestaurants = _allRestaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                onChanged: _filterRestaurants,
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
              itemCount: _filteredRestaurants.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantProfilePage(
                          restaurant: _filteredRestaurants[index],
                        ),
                      ),
                    );
                  },
                  child:
                      RestaurantItem(restaurant: _filteredRestaurants[index]),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            restaurant.logo,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
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
