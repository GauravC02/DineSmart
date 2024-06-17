import 'package:flutter/material.dart';
import 'restaurants.dart'; // Import your Restaurant class and allRestaurants list

class DinePage extends StatefulWidget {
  final String restaurantName;

  DinePage({required this.restaurantName});

  @override
  _DinePageState createState() => _DinePageState();
}

class _DinePageState extends State<DinePage> {
  Restaurant? _restaurant;
  Map<String, int> _quantities = {};

  @override
  void initState() {
    super.initState();
    _restaurant = _findRestaurant(widget.restaurantName);
    _initializeQuantities();
  }

  Restaurant? _findRestaurant(String name) {
    return allRestaurants.firstWhere(
      (restaurant) => restaurant.name == name,
    );
  }

  void _initializeQuantities() {
    if (_restaurant != null) {
      for (var category in _restaurant!.menu) {
        for (var item in category.items) {
          _quantities[item.name] = 0; // Initialize all quantities to 0
        }
      }
    }
  }

  void _incrementQuantity(String itemName) {
    setState(() {
      _quantities[itemName] = (_quantities[itemName] ?? 0) + 1;
    });
  }

  void _decrementQuantity(String itemName) {
    setState(() {
      if ((_quantities[itemName] ?? 0) > 0) {
        _quantities[itemName] = (_quantities[itemName] ?? 0) - 1;
      }
    });
  }

  double _calculateTotalAmount() {
    double total = 0.0;
    if (_restaurant != null) {
      for (var category in _restaurant!.menu) {
        for (var item in category.items) {
          total += item.price * (_quantities[item.name] ?? 0);
        }
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (_restaurant == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Details'),
        ),
        body: Center(
          child: Text('Restaurant not found.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_restaurant!.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(_restaurant!.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _restaurant!.menu.length,
                      itemBuilder: (context, index) {
                        final category = _restaurant!.menu[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: category.items.length,
                              itemBuilder: (context, idx) {
                                final item = category.items[idx];
                                return Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 4,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    title: Text(item.name),
                                    subtitle: Text(
                                        'Nrs ${item.price.toStringAsFixed(2)}'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () =>
                                              _decrementQuantity(item.name),
                                        ),
                                        Text('${_quantities[item.name]}'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () =>
                                              _incrementQuantity(item.name),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nrs ${_calculateTotalAmount().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle order action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order placed!'),
                  ),
                );
              },
              child: Text('Order'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                textStyle: TextStyle(fontSize: 20),
                foregroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
