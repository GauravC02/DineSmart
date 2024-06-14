// categories.dart
import 'package:flutter/material.dart';

// Define a class for an item in a category
class Item {
  final String name;
  final String image;

  Item({
    required this.name,
    required this.image,
  });
}

// Define your list of categories
class Category {
  final String name;
  final String image;
  final List<Item> items; // List of items in the category

  Category({
    required this.name,
    required this.image,
    required this.items,
  });
}

// Sample data for categories and items
final List<Category> allCategories = [
  Category(
    name: 'Breakfast',
    image: 'assets/breakfast.png',
    items: [
      Item(name: 'Omelette', image: 'assets/omelette.png'),
      Item(name: 'Pancakes', image: 'assets/pancakes.png'),
    ],
  ),
  Category(
    name: 'Snacks',
    image: 'assets/snack.png',
    items: [
      Item(name: 'Pizza', image: 'assets/pizza.png'),
      Item(name: 'Burger', image: 'assets/burger.png'),
    ],
  ),
  Category(
    name: 'Dinner',
    image: 'assets/dinner.png',
    items: [
      Item(name: 'Steak', image: 'assets/steak.png'),
      Item(name: 'Spaghetti', image: 'assets/spaghetti.png'),
    ],
  ),
  Category(
    name: 'Desserts',
    image: 'assets/dessert.png',
    items: [
      Item(name: 'Cake', image: 'assets/cake.png'),
      Item(name: 'Ice Cream', image: 'assets/icecream.png'),
    ],
  ),
  Category(
    name: 'Drinks',
    image: 'assets/drink.png',
    items: [
      Item(name: 'Coffee', image: 'assets/coffee.png'),
      Item(name: 'Alcohol', image: 'assets/alcohol.png'),
    ],
  ),
];

// Create separate pages for each category
class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount:
            category.items.length, // Use the number of items in the category
        itemBuilder: (BuildContext context, int index) {
          Item item = category.items[index];
          return GestureDetector(
            onTap: () {
              // Handle tap on grid item if needed
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
