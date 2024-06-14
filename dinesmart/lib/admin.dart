import 'package:flutter/material.dart';
import 'restaurants.dart'; // Import your Restaurant class and allRestaurants list

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _logoController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _coverImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Restaurant Name'),
            ),
            TextField(
              controller: _logoController,
              decoration: InputDecoration(labelText: 'Logo URL'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _coverImageController,
              decoration: InputDecoration(labelText: 'Cover Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addRestaurant(context);
              },
              child: Text('Add Restaurant'),
            ),
            SizedBox(height: 20),
            Text(
              'All Restaurants:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = allRestaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(restaurant.logo),
                      radius: 25, // Adjust the size as needed
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _confirmDelete(context, index, restaurant.name);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addRestaurant(BuildContext context) {
    // Validate input fields
    if (_nameController.text.isEmpty ||
        _logoController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _coverImageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final newRestaurant = Restaurant(
      name: _nameController.text,
      logo: _logoController.text,
      location: _locationController.text,
      coverImage: _coverImageController.text,
      menu: [], // Initialize with an empty menu or predefined categories
    );

    allRestaurants.add(newRestaurant);

    setState(() {
      _nameController.clear();
      _logoController.clear();
      _locationController.clear();
      _coverImageController.clear();
    });

    // Show snack bar or toast to indicate successful addition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Restaurant added successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index, String restaurantName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text(
              'Are you sure you want to delete the restaurant "$restaurantName"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  allRestaurants.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
