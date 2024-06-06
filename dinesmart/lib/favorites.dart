import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'restaurants.dart';
import 'restaurantdine.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Restaurant> favoriteRestaurants =
        allRestaurants.where((restaurant) => restaurant.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteRestaurants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15.0), // Adjust the vertical padding as needed
            child: ListTile(
              title: Text(favoriteRestaurants[index].name),
              leading: Container(
                width: 80,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    favoriteRestaurants[index].logo,
                    fit: BoxFit.contain, // You can adjust the fit as needed
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantProfilePage(
                      restaurant: favoriteRestaurants[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1,
        onItemTapped: (index) {},
      ),
    );
  }
}
