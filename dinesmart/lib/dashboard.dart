import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'restaurantdine.dart';
import 'bottomnavigationbar.dart'; // Import the bottomnavigationbar.dart file

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Empty title
        automaticallyImplyLeading: false, // Remove default back button
        leading: IconButton(
          icon: Icon(Icons.person), // User icon
          onPressed: () {
            // Handle user icon tap
            // You can implement any desired functionality here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search icon
            onPressed: () {
              showSearch(
                context: context,
                delegate: RestaurantSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Column(
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
                        // Handle login button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
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
                        // Handle signup button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
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
          SizedBox(height: 16.0), // Add space between buttons and offer banner
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildOfferImage(context, 'assets/kfcoffer.png'),
                _buildOfferImage(context, 'assets/pizzahutoffer.png'),
                _buildOfferImage(context, 'assets/burgerkingoffer.png'),
                // Add more offer images as needed
              ],
            ),
          ),
          SizedBox(height: 16.0), // Add space between banners and categories
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0), // Add space below categories title
          Container(
            height: 141.0, // Match the height to the ListView of restaurants
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryBox('Breakfast', 'assets/breakfast.png'),
                _buildCategoryBox('Snacks', 'assets/snack.png'),
                _buildCategoryBox('Dinner', 'assets/dinner.png'),
                _buildCategoryBox('Desserts', 'assets/dessert.png'),
                _buildCategoryBox('Drinks', 'assets/drink.png'),
                // Add more categories as needed
              ],
            ),
          ),
          SizedBox(
              height: 16.0), // Add space between categories and restaurants
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Restaurants',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0), // Add space below restaurants title
          Container(
            height: 141.0, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: allRestaurants.map((restaurant) {
                return _buildRestaurantCard(context, restaurant);
              }).toList(),
            ),
          ),
          Expanded(
            child: DashboardContent(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        // Use the BottomNavigationBarWidget here
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildOfferImage(BuildContext context, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width, // Use full screen width
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCategoryBox(String category, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 111.0, // Decrease width by 9 pixels
            height: 111.0, // Decrease height by 9 pixels
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5.0), // Add space between image and text
          Text(
            category,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 91, // Decrease width by 9 pixels
              height: 91, // Decrease height by 9 pixels
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
    // Implement your search logic here
    // Return the search results widget
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Search Results for: $query',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions logic here
    // Return the search suggestions widget
    return Container();
  }
}
