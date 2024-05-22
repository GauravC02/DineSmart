import 'package:flutter/material.dart';
import 'restaurants.dart';
import 'menu.dart';

class RestaurantProfilePage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  late MenuCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.restaurant.menu.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Cover Image with Logo
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: double.infinity,
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.restaurant.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Image.asset(
                    widget.restaurant.logo,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            widget.restaurant.name,
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
                for (MenuCategory category in widget.restaurant.menu)
                  CategoryButton(
                    category: category,
                    isSelected: category == _selectedCategory,
                    onPressed: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _selectedCategory.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (MenuItem item in _selectedCategory.items)
                        MenuItemWidget(item: item),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final MenuCategory category;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton({
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.blue
              : Colors.grey[200], // Use backgroundColor for background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          category.name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  MenuItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        '${item.name} - \$${item.price.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
