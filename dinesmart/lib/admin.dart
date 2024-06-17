import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'restaurants.dart'; // Import your Restaurant class and allRestaurants list
import 'qrgenerator.dart';
import 'Dine.dart';
import 'package:dinesmart/Models/Location.dart'; // Import Location class
import '../Address.dart'; // Import Address class
import 'package:dinesmart/Models/Requests/ResturantRequest.dart'; // Import ResturantRequest class
import './Models/Address.dart';
import 'package:http/http.dart' as http;
import 'Constants/Constants.dart' as con;

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationLatitudeController =
      TextEditingController();
  final TextEditingController _locationLongitudeController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
              _buildAddressField(),
              _buildLocationFields(),
              _buildTextField(_emailController, 'Email'),
              _buildTextField(_phoneController, 'Phone'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  ResturantRequest r = ResturantRequest(
                    name: _nameController.text,
                    address: Address(
                      detailedPlace: _addressController.text,
                    ),
                    location: Location(
                      latitude: double.parse(_locationLatitudeController.text),
                      longitude:
                          double.parse(_locationLongitudeController.text),
                    ),
                    email: _emailController.text,
                    phone: _phoneController.text,
                  );
                  print(r);

                  String baseUrl = con.baseUrl;
                  final response = await http.post(
                      Uri.parse("$baseUrl/resturant/save"),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8'
                      },
                      body: json.encode(r.toJson()));
                  print(json.decode(response.body));
                  //_addRestaurant(context);
                },
                child: Text('Add Restaurant'),
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

  Widget _buildAddressField() {
    return _buildTextField(_addressController, 'Address');
  }

  Widget _buildLocationFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(_locationLatitudeController, 'Latitude'),
        SizedBox(height: 10),
        _buildTextField(_locationLongitudeController, 'Longitude'),
      ],
    );
  }

  void _addRestaurant(BuildContext context) {
    // Validate input fields
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _locationLatitudeController.text.isEmpty ||
        _locationLongitudeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Show snack bar or toast to indicate successful addition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Restaurant added successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
