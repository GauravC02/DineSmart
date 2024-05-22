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
