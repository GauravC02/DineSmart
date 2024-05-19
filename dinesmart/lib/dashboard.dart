import 'package:flutter/material.dart';
import 'login.dart'; // Import your login page file
import 'dashboardcontent.dart';
import 'restaurantdine.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(
        onLogoutPressed: () {
          // Call the logout function
          _logout(context);
        },
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
                        // Navigate to login page or perform any desired action
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
                        // Navigate to signup page or perform any desired action
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
                TextButton(
                  onPressed: () {
                    // Handle view more categories
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0), // Add space below categories title
          Container(
            height: 100.0, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryBox('Breakfast'),
                _buildCategoryBox('Snacks'),
                _buildCategoryBox('Dinner'),
                _buildCategoryBox('Desserts'),
                _buildCategoryBox('Drinks'),
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDinePage(),
                      ),
                    );
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0), // Add space below restaurants title
          Container(
            height: 150.0, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRestaurantCard(
                    context,
                    'KFC',
                    'assets/kfc.png',
                    Restaurant(
                        name: 'KFC',
                        logo: 'assets/kfc.png',
                        location: 'Kathmandu',
                        coverImage: 'assets/kfccover.png')),
                _buildRestaurantCard(
                    context,
                    'Pizza Hut',
                    'assets/pizzahut.png',
                    Restaurant(
                        name: 'Pizza Hut',
                        logo: 'assets/pizzahut.png',
                        location: 'Lalitpur',
                        coverImage: 'assets/pizzahutcover.png')),
                _buildRestaurantCard(
                    context,
                    'McDonalds',
                    'assets/mcdonalds.png',
                    Restaurant(
                        name: 'McDonalds',
                        logo: 'assets/mcdonalds.png',
                        location: 'Bhaktapur',
                        coverImage: 'assets/mcdonaldscover.png')),
                _buildRestaurantCard(
                    context,
                    'Burger King',
                    'assets/burgerking.png',
                    Restaurant(
                        name: 'Burger King',
                        logo: 'assets/burgerking.png',
                        location: 'Dhulikhel',
                        coverImage: 'assets/burgerkingcover.png')),
                _buildRestaurantCard(
                    context,
                    'Starbucks',
                    'assets/starbucks.png',
                    Restaurant(
                        name: 'Starbucks',
                        logo: 'assets/starbucks.png',
                        location: 'Pokhara',
                        coverImage: 'assets/starbuckscover.png')),
                // Add more restaurants as needed
              ],
            ),
          ),
          Expanded(
            child: DashboardContent(),
          ),
        ],
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

  Widget _buildCategoryBox(String category) {
    return Container(
      width: 100.0, // Adjust width as needed
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: Alignment.center,
      child: Text(category),
    );
  }

  Widget _buildRestaurantCard(
      BuildContext context, String name, String logo, Restaurant restaurant) {
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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  logo,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Use Navigator to pop the DashboardPage and return to the LoginPage
    Navigator.pop(context);
  }
}

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogoutPressed;

  const DashboardAppBar({required this.onLogoutPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(''), // Empty title
      automaticallyImplyLeading: false, // Remove default back button
      leading: IconButton(
        icon: Icon(Icons.person), // Use user icon
        onPressed: () {
          // Handle user icon tap
          // You can implement any desired functionality here
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: onLogoutPressed,
        ),
      ],
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Return an empty Container
  }
}
