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

  List<Restaurant> deletedRestaurants = []; // Track deleted restaurants

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add New Restaurant',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField(_nameController, 'Restaurant Name'),
              _buildTextField(_logoController, 'Logo URL'),
              _buildTextField(_locationController, 'Location'),
              _buildTextField(_coverImageController, 'Cover Image URL'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addRestaurant(context);
                },
                child: Text('Add Restaurant'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'All Restaurants:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = allRestaurants[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(restaurant.location),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(restaurant.logo),
                        radius: 30,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _confirmDelete(context, index, restaurant.name);
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _restoreDeletedRestaurants(context);
                },
                child: Text('Restore Deleted Restaurants'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
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

    setState(() {
      allRestaurants.add(newRestaurant);
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
                  deletedRestaurants.add(allRestaurants[index]);
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

  void _restoreDeletedRestaurants(BuildContext context) {
    if (deletedRestaurants.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No restaurants to restore.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Restore Deleted Restaurants'),
          content:
              Text('Are you sure you want to restore all deleted restaurants?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Restore'),
              onPressed: () {
                setState(() {
                  allRestaurants.addAll(deletedRestaurants);
                  deletedRestaurants.clear();
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
