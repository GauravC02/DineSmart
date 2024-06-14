// restaurantdine.dart

import 'package:flutter/material.dart';
import 'restaurants.dart';
import 'menu.dart';
import 'package:dinesmart/bottomnavigationbar.dart' as bottom_nav_bar;
import 'cart.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class RestaurantProfilePage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  late MenuCategory _selectedCategory;
  late Map<int, int> _itemQuantities;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.restaurant.menu.first;
    _itemQuantities = Map.fromIterable(
      _selectedCategory.items,
      key: (item) => item.id,
      value: (item) => 0,
    );
  }

  void _onQuantityChanged(int itemId, int newQuantity) {
    setState(() {
      _itemQuantities[itemId] = newQuantity >= 0 ? newQuantity : 0;
    });
  }

  MenuItem _findMenuItem(int itemId) {
    for (var category in widget.restaurant.menu) {
      final item = category.items.firstWhere(
        (item) => item.id == itemId,
        orElse: () => MenuItem(id: -1, name: '', price: 0),
      );
      if (item.id != -1) {
        return item;
      }
    }
    throw Exception('Item with ID $itemId not found.');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        final themeData =
            themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light();
        return Theme(
          data: themeData,
          child: Scaffold(
            backgroundColor:
                themeNotifier.isDarkMode ? Colors.black : Colors.white,
            appBar: AppBar(
              title: Text(widget.restaurant.name),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: IconButton(
                    onPressed: () {
                      bool itemsSelected = _itemQuantities.entries
                          .any((entry) => entry.value > 0);
                      if (!itemsSelected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('The cart is empty.')),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(
                              items: _itemQuantities.entries
                                  .where((entry) => entry.value > 0)
                                  .map((entry) => {
                                        'id': entry.key,
                                        'quantity': entry.value,
                                        'name': _findMenuItem(entry.key).name,
                                        'price': _findMenuItem(entry.key).price,
                                      })
                                  .toList(),
                              restaurantName: widget.restaurant.name,
                              updateItemQuantity: _onQuantityChanged,
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(widget.restaurant.coverImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  child: Image.asset(
                                    widget.restaurant.logo,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            widget.restaurant.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (MenuCategory category
                                  in widget.restaurant.menu)
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
                      ],
                    ),
                  ),
                ];
              },
              body: ListView.builder(
                itemCount: _selectedCategory.items.length,
                itemBuilder: (context, index) {
                  final item = _selectedCategory.items[index];
                  return MenuItemWidget(
                    item: item,
                    quantity: _itemQuantities[item.id] ?? 0,
                    onQuantityChanged: (newQuantity) {
                      _onQuantityChanged(item.id, newQuantity);
                    },
                  );
                },
              ),
            ),
            bottomNavigationBar: bottom_nav_bar.BottomNavigationBarWidget(
              selectedIndex: 0,
              onItemTapped: (index) {},
            ),
          ),
        );
      },
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? theme.primaryColor : theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          category.name,
          style: TextStyle(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  MenuItemWidget({
    required this.item,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 31),
                Row(
                  children: [
                    IconButton(
                      iconSize: 20,
                      onPressed: () {
                        onQuantityChanged(quantity - 1);
                      },
                      icon: Icon(Icons.remove,
                          color: theme.colorScheme.onSurface),
                    ),
                    Text(
                      quantity.toString(),
                      style: theme.textTheme.bodyLarge,
                    ),
                    IconButton(
                      iconSize: 20,
                      onPressed: () {
                        onQuantityChanged(quantity + 1);
                      },
                      icon: Icon(Icons.add, color: theme.colorScheme.onSurface),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
