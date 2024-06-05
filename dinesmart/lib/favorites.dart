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
          return ListTile(
            title: Text(favoriteRestaurants[index].name),
            leading: Image.asset(favoriteRestaurants[index].logo),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantProfilePage(
                      restaurant: favoriteRestaurants[index]),
                ),
              );
            },
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
