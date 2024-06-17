import 'dart:convert';

import 'package:dinesmart/Models/New_Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'signup.dart';
import 'restaurantdine.dart';
import 'restaurants.dart';
import 'bottomnavigationbar.dart';
import 'theme.dart';
import 'profile.dart'; // Import the ProfilePage
import 'categories.dart'; // Import the categories.dart file
import 'package:http/http.dart' as http;
import 'Constants/Constants.dart' as con;

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  List<New_Resturant> resturants = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchResturants();
  }

  void _fetchResturants() async {
    String baseUrl = con.baseUrl;
    final response = await http.get(Uri.parse('$baseUrl/resturant/all'));
    if (response.statusCode == 200) {
      final List<dynamic> restaurantJson = json.decode(response.body);
      print(restaurantJson);
      setState(() {
        resturants =
            restaurantJson.map((json) => New_Resturant.fromJson(json)).toList();
      });

      //print(resturants);
    } else {
      // Handle the error
      throw Exception('Failed to load restaurants');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? username =
        ModalRoute.of(context)!.settings.arguments as String?;

    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          title: Text('Welcome ${username ?? "User"}'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: RestaurantSearchDelegate(),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: Text(
                            'Signup',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildOfferImage(context, 'assets/kfcoffer.png'),
                    _buildOfferImage(context, 'assets/pizzahutoffer.png'),
                    _buildOfferImage(context, 'assets/burgerkingoffer.png'),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 141.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: allCategories.map((category) {
                    return _buildCategoryBox(context, category);
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Restaurants',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 141.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: allRestaurants.map((restaurant) {
                    return _buildRestaurantCard(context, restaurant);
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DashboardContent(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        backgroundColor:
            themeNotifier.currentTheme.brightness == Brightness.light
                ? Colors.white
                : themeNotifier.currentTheme.scaffoldBackgroundColor,
      );
    });
  }

  Widget _buildOfferImage(BuildContext context, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCategoryBox(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: category),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Image.asset(
              category.image,
              width: 111.0,
              height: 111.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5.0),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantProfilePage(restaurant: restaurant),
          ),
        );
      },
      onLongPress: () {
        setState(() {
          restaurant.isFavorite = !restaurant.isFavorite;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 91,
                  height: 91,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      restaurant.logo,
                      width: 72,
                      height: 72,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (restaurant.isFavorite)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              restaurant.name,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Results',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Restaurant> suggestedRestaurants = query.isEmpty
        ? allRestaurants
        : allRestaurants
            .where((restaurant) =>
                restaurant.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: suggestedRestaurants.length,
        itemBuilder: (context, index) {
          final Restaurant restaurant = suggestedRestaurants[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(restaurant.logo),
            ),
            title: Text(restaurant.name),
            onTap: () {
              query = restaurant.name;
              showResults(context);
            },
          );
        },
      ),
    );
  }
}
