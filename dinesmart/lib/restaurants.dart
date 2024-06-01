import 'package:flutter/material.dart';
import 'menu.dart';

class Restaurant {
  final String name;
  final String logo;
  final String location;
  final String coverImage;
  final List<MenuCategory> menu;
  bool isFavorite;

  Restaurant({
    required this.name,
    required this.logo,
    required this.location,
    required this.coverImage,
    required this.menu,
    this.isFavorite = false,
  });
}

final List<Restaurant> allRestaurants = [
  Restaurant(
    name: 'KFC',
    logo: 'assets/kfc.png',
    location: 'Kathmandu',
    coverImage: 'assets/kfccover.png',
    menu: kfcMenu,
  ),
  Restaurant(
    name: 'Pizza Hut',
    logo: 'assets/pizzahut.png',
    location: 'Lalitpur',
    coverImage: 'assets/pizzahutcover.png',
    menu: pizzaHutMenu,
  ),
  Restaurant(
    name: 'McDonalds',
    logo: 'assets/mcdonalds.png',
    location: 'Bhaktapur',
    coverImage: 'assets/mcdonaldscover.png',
    menu: mcdonaldsMenu,
  ),
  Restaurant(
    name: 'Burger King',
    logo: 'assets/burgerking.png',
    location: 'Dhulikhel',
    coverImage: 'assets/burgerkingcover.png',
    menu: burgerKingMenu,
  ),
  Restaurant(
    name: 'Starbucks',
    logo: 'assets/starbucks.png',
    location: 'Pokhara',
    coverImage: 'assets/starbuckscover.png',
    menu: starbucksMenu,
  ),
];
