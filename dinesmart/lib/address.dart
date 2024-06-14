import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'theme.dart';
import 'maps.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // Variables to store address details
  String name = '';
  String address = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      onChanged: (value) {
                        // Here you might want to save last name
                      },
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                // Here you might want to save phone number
              },
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                _navigateToMap(); // Navigate to map page to choose address
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      address.isNotEmpty ? address : 'Choose Address',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Icon(Icons.location_on, color: Colors.blueAccent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToMap() async {
    // Navigate to the MapPage and wait for the chosen location
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(),
      ),
    );

    // Update the delivery location if a location was chosen
    if (result != null) {
      // Use Geocoding API to get the name of the location
      try {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(result.latitude, result.longitude);
        if (placemarks.isNotEmpty) {
          setState(() {
            address = _buildAddressString(placemarks[0]);
            // Update the name variable if needed
            name = ''; // Clear the name field
          });
        }
      } catch (e) {
        print("Error getting address: $e");
      }
    }
  }

  String _buildAddressString(Placemark placemark) {
    return '${placemark.street}, ${placemark.locality}';
  }
}
