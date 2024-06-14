// categories.dart
import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

// Define your list of categories
final List<Category> allCategories = [
  Category(
    name: 'Breakfast',
    image: 'assets/breakfast.png',
  ),
  Category(
    name: 'Snacks',
    image: 'assets/snack.png',
  ),
  Category(
    name: 'Dinner',
    image: 'assets/dinner.png',
  ),
  Category(
    name: 'Desserts',
    image: 'assets/dessert.png',
  ),
  Category(
    name: 'Drinks',
    image: 'assets/drink.png',
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
            4, // Change to the actual number of items you want to display
        itemBuilder: (BuildContext context, int index) {
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
                        image: AssetImage(category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Item ${index + 1}',
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
